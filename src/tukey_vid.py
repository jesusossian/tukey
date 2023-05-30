import urllib.request
import io
import zipfile

from pathlib import Path
import os

import matplotlib.pyplot as plt
import networkx as nx
import numpy as np
import pandas as pd
import gurobipy as gp
from gurobipy import GRB

import igraph as ig

from itertools import combinations

import sys
from datetime import datetime, date

RESULT_PATH   = Path('../result/')

def is_subclique(G, nodelist):
    '''
    For each pair of nodes in nodelist whether there is an edge
    if any edge is missing, we know that it's not a subclique.
    if all edges are there, it is a subclique
    '''
    for (u,v) in combinations(nodelist,2):  #check each possible pair
        if not G.has_edge(u,v):
            return False #if any edge is missing we're done
    return True  #if we get to here, then every edge was there.  It's True.

def tukey_max_neighb(method_,form_,inst_,id_,instance,G):
  
  N = nx.number_of_nodes(G)
  M = nx.number_of_edges(G)

  dm = np.zeros((N,N), dtype=int)

  p = nx.shortest_path(G)

  for i in range(0,N):
     for j in range(0,N):
        dm[i][j] = len(p[i][j])-1

  lb = np.zeros((N), dtype=float)
  ub = np.zeros((N), dtype=float)
  time = np.zeros((N), dtype=float)
  gap = np.zeros((N), dtype=float)
  nodes = np.zeros((N), dtype=float)
  status = np.zeros((N), dtype=float)

  for i in G: # begin tukey node i

    #print("node %d" %i)
    
    Ni = nx.neighbors(G,i)

    lista = []
    for k in Ni:
      lista.append(k)
    

    if(is_subclique(G, lista)):
      # if clique
      #print("tukey[%d] = 1" %i)
      lb[i] = 1
      ub[i] = 1
      gap[i] = 0.0
      time[i] = 0.0
      nodes[i] = 0
      status[i] = 1
    else:
      # if not clique

      model = gp.Model(f"{method_}_{form_}_{inst_}_{id_}")

      if (method_=="mip"):
        x = model.addVars(N, vtype=GRB.BINARY, name="x")
      else:
        x = model.addVars(N, lb=0.0, ub=1.0, vtype=GRB.CONTINUOUS, name="x")
        
      # configurando parametros
      model.Params.TimeLimit = 3600
      model.Params.MIPGap = 1.e-6
      model.Params.Threads = 1
      # model.Params.Presolve = 0
      # model.Params.Cuts = 0
 
      # Turn off display and heuristics
      #gp.setParam('OutputFlag', 0)
      #gp.setParam('Heuristics', 0)

      obj = 0
      for j in G:
        obj += 1 * x[j]
         
      model.setObjective(obj, GRB.MAXIMIZE)     

      model.addConstr(x[i] == 0, "fix_x")

      for u in range(0,N):
        Nu = nx.neighbors(G,u)
        
        lNu = []
        for j in Nu:
          lNu.append(j)

        for w in range(0,N):
          if (w != u) and (w not in lNu):
            for s in lNu:
              if (s != w):
                if (dm[u,s] + dm[s,w] == dm[u,w]):
                  model.addConstr(x[u] + x[w] <= 1 + x[s], "geodesic")

      #model.write(f"{method_}_{form_}_{inst_}_{id_}.lp")

      if method_ != "mip":
        relax = model.relax()
        relax.optimize()
      else:
        model.optimize()

      tmp = 0
      if model.status == GRB.OPTIMAL:
        tmp = 1

      if (method_=="mip"):
        lb[i] = model.objBound
        ub[i] = model.objVal
        gap[i] = model.MIPGap
        time[i] = model.Runtime
        nodes[i] = model.NodeCount
        status[i] = tmp
      else:
        ub[i] = model.objVal
        time[i] = model.Runtime
        status[i] = tmp

    if (method_=="mip"):
      arquivo = open(
        os.path.join(RESULT_PATH,instance),'a'
      )
      tmp = i
      arquivo.write(
        str(tmp)+';'
        +str(round(lb[i],1))+';'
        +str(round(ub[i],1))+';'
        +str(round(gap[i],2))+';'
        +str(round(time[i],2))+';'
        +str(round(nodes[i],1))+';'
        +str(round(status[i],1))+'\n'
      )
      arquivo.close()
    else:
      arquivo = open(
        os.path.join(RESULT_PATH,instance),'a'
      )
      tmp = i
      arquivo.write(
        str(tmp)+';'
        +str(round(ub[i],1))+';'
        +str(round(time[i],2))+';'
        +str(round(status[i],1))+'\n'
      )
      arquivo.close()
        
    model.dispose()    

  # end tukey for node i


def tukey_max_miset(method_,form_,inst_,id_,instance,G):
  
  N = nx.number_of_nodes(G)
  M = nx.number_of_edges(G)

  dm = np.zeros((N,N), dtype=int)

  p = nx.shortest_path(G)

  for i in range(0,N):
     for j in range(0,N):
        dm[i][j] = len(p[i][j])-1

  lb = np.zeros((N), dtype=float)
  ub = np.zeros((N), dtype=float)
  time = np.zeros((N), dtype=float)
  gap = np.zeros((N), dtype=float)
  nodes = np.zeros((N), dtype=float)
  status = np.zeros((N), dtype=float)

  for i in G: # begin tukey node i

    #print("node %d" %i)
    
    Ni = nx.neighbors(G,i)

    lista = []
    for k in Ni:
      lista.append(k)
    

    if(is_subclique(G, lista)):
      # if clique
      #print("tukey[%d] = 1" %i)
      lb[i] = 1
      ub[i] = 1
      gap[i] = 0.0
      time[i] = 0.0
      nodes[i] = 0
      status[i] = 1
    else:
      # if not clique

      model = gp.Model(f"{method_}_{form_}_{inst_}_{id_}")

      if (method_=="mip"):
        x = model.addVars(N, vtype=GRB.BINARY, name="x")
      else:
        x = model.addVars(N, lb=0.0, ub=1.0, vtype=GRB.CONTINUOUS, name="x")
        
      # configurando parametros
      model.Params.TimeLimit = 3600
      model.Params.MIPGap = 1.e-6
      model.Params.Threads = 1
      # model.Params.Presolve = 0
      # model.Params.Cuts = 0
 
      # Turn off display and heuristics
      #gp.setParam('OutputFlag', 0)
      #gp.setParam('Heuristics', 0)

      obj = 0
      for j in G:
        obj += 1 * x[j]
         
      model.setObjective(obj, GRB.MAXIMIZE)     

      model.addConstr(x[i] == 0,"fix_x")

      for u in range(0,N):
        for w in range(u+1,N):
          #if dm[u,w] <= N:
            for s in range(0,N):
              if (s != u) and (s != w):
                if (dm[u,s] + dm[s,w] == dm[u,w]):
                  model.addConstr(x[u] + x[w] <= 1 + x[s], "geodesic")

      # maximal independent set constraints
      for u in range(0,N):
        Nu = nx.neighbors(G,u)
        list2 = []
        for k in Nu:
          list2.append(k)

        T = nx.Graph()
        T.add_nodes_from(list2)
        for (a,b) in combinations(list2,2):
          if G.has_edge(a,b):
            T.add_edge(a,b)


        Im = nx.maximal_independent_set(T)
        
        if (len(Im) > 0):
          constr = 0
          for k in Im:
            constr += 1 * x[k]
          model.addConstr(constr <= 1 + (len(Im) - 1)*x[u], "miset")

        T.clear()

      #model.write(f"{method_}_{form_}_{inst_}_{id_}.lp")

      if method_ != "mip":
        relax = model.relax()    
        relax.optimize()
      else:
        model.optimize()

      tmp = 0
      if model.status == GRB.OPTIMAL:
        tmp = 1

      if (method_=="mip"):
        lb[i] = model.objBound
        ub[i] = model.objVal
        gap[i] = model.MIPGap
        time[i] = model.Runtime
        nodes[i] = model.NodeCount
        status[i] = tmp
      else:
        ub[i] = model.objVal
        time[i] = model.Runtime
        status[i] = tmp

    if (method_=="mip"):
      arquivo = open(
        os.path.join(RESULT_PATH,instance),'a'
      )
      tmp = i
      arquivo.write(
        str(tmp)+';'
        +str(round(lb[i],1))+';'
        +str(round(ub[i],1))+';'
        +str(round(gap[i],2))+';'
        +str(round(time[i],2))+';'
        +str(round(nodes[i],1))+';'
        +str(round(status[i],1))+'\n'
      )
      arquivo.close()
    else:
      arquivo = open(
        os.path.join(RESULT_PATH,instance),'a'
      )
      tmp = i
      arquivo.write(
        str(tmp)+';'
        +str(round(ub[i],1))+';'
        +str(round(time[i],2))+';'
        +str(round(status[i],1))+'\n'
      )
      arquivo.close()

    model.dispose()
    
  # end tukey for node i


def tukey_max(method_,form_,inst_,id_,instance,G):
  
  N = nx.number_of_nodes(G)
  M = nx.number_of_edges(G)

  dm = np.zeros((N,N), dtype=int)

  p = nx.shortest_path(G)

  for i in range(0,N):
     for j in range(0,N):
        dm[i][j] = len(p[i][j])-1

  lb = np.zeros((N), dtype=float)
  ub = np.zeros((N), dtype=float)
  time = np.zeros((N), dtype=float)
  gap = np.zeros((N), dtype=float)
  nodes = np.zeros((N), dtype=float)
  status = np.zeros((N), dtype=float)

  for i in G: # begin tukey node i

    #print("node %d" %i)
    
    Ni = nx.neighbors(G,i)

    lista = []
    for k in Ni:
      lista.append(k)
    

    if(is_subclique(G, lista)):
      # if clique
      #print("tukey[%d] = 1" %i)
      lb[i] = 1
      ub[i] = 1
      gap[i] = 0.0
      time[i] = 0.0
      nodes[i] = 0
      status[i] = 1
    else:
      # if not clique

      model = gp.Model(f"{method_}_{form_}_{inst_}_{id_}")

      if (method_=="mip"):
        x = model.addVars(N, vtype=GRB.BINARY, name="x")
      else:
        x = model.addVars(N, lb=0.0, ub=1.0, vtype=GRB.CONTINUOUS, name="x")
        
      # configurando parametros
      model.Params.TimeLimit = 3600
      model.Params.MIPGap = 1.e-6
      model.Params.Threads = 1
      # model.Params.Presolve = 0
      # model.Params.Cuts = 0
 
      # Turn off display and heuristics
      #gp.setParam('OutputFlag', 0)
      #gp.setParam('Heuristics', 0)

      obj = 0
      for j in G:
        obj += 1 * x[j]
         
      model.setObjective(obj, GRB.MAXIMIZE)     

      model.addConstr(x[i] == 0, "fix_x")

      for u in range(0,N):
        for w in range(u+1,N):
          #if dm[u,w] <= N:
            for s in range(0,N):
              if (s != u) and (s != w):
                if (dm[u,s] + dm[s,w] == dm[u,w]):
                  model.addConstr(x[u] + x[w] <= 1 + x[s], "miset")

      #model.write(f"{method_}_{form_}_{inst_}_{id_}.lp")

      if method_ != "mip":
        relax = model.relax()
        relax.optimize()
      else:
        model.optimize()

      tmp = 0
      if model.status == GRB.OPTIMAL:
        tmp = 1

      if (method_=="mip"):
        lb[i] = model.objBound
        ub[i] = model.objVal
        gap[i] = model.MIPGap
        time[i] = model.Runtime
        nodes[i] = model.NodeCount
        status[i] = tmp
      else:
        ub[i] = model.objVal
        time[i] = model.Runtime
        status[i] = tmp

    if (method_=="mip"):
      arquivo = open(
        os.path.join(RESULT_PATH,instance),'a'
      )
      tmp = i
      arquivo.write(
        str(tmp)+';'
        +str(round(lb[i],1))+';'
        +str(round(ub[i],1))+';'
        +str(round(gap[i],2))+';'
        +str(round(time[i],2))+';'
        +str(round(nodes[i],1))+';'
        +str(round(status[i],1))+'\n'
      )
      arquivo.close()
    else:
      arquivo = open(
        os.path.join(RESULT_PATH,instance),'a'
      )
      tmp = i
      arquivo.write(
        str(tmp)+';'
        +str(round(ub[i],1))+';'
        +str(round(time[i],2))+';'
        +str(round(status[i],1))+'\n'
      )
      arquivo.close()

    model.dispose()
    
  # end tukey for node i


def tukey_min(method_,form_,inst_,id_,instance,G):
  
  N = nx.number_of_nodes(G)
  M = nx.number_of_edges(G)

  dm = np.zeros((N,N), dtype=int)

  p = nx.shortest_path(G)

  for i in range(0,N):
     for j in range(0,N):
        dm[i][j] = len(p[i][j])-1

  lb = np.zeros((N), dtype=float)
  ub = np.zeros((N), dtype=float)
  time = np.zeros((N), dtype=float)
  gap = np.zeros((N), dtype=float)
  nodes = np.zeros((N), dtype=float)
  status = np.zeros((N), dtype=float)

  for i in G: # begin tukey node i

    #print("node %d" %i)
    
    Ni = nx.neighbors(G,i)

    lista = []
    for k in Ni:
      lista.append(k)
    

    if(is_subclique(G, lista)):
      # if clique
      #print("tukey[%d] = 1" %i)
      lb[i] = 1
      ub[i] = 1
      gap[i] = 0.0
      time[i] = 0.0
      nodes[i] = 0
      status[i] = 1
    else:
      # if not clique

      model = gp.Model(f"{method_}_{form_}_{inst_}_{id_}")

      if (method_=="mip"):
        x = model.addVars(N, vtype=GRB.BINARY, name="x")
      else:
        x = model.addVars(N, lb=0.0, ub=1.0, vtype=GRB.CONTINUOUS, name="x")
        
      # configurando parametros
      model.Params.TimeLimit = 3600
      model.Params.MIPGap = 1.e-6
      model.Params.Threads = 1
      # model.Params.Presolve = 0
      # model.Params.Cuts = 0
 
      # Turn off display and heuristics
      #gp.setParam('OutputFlag', 0)
      #gp.setParam('Heuristics', 0)

      obj = 0
      for j in G:
        obj += 1 * x[j]
         
      model.setObjective(obj, GRB.MINIMIZE)

      model.addConstr(x[i] == 1)

      for u in range(0,N):
        for w in range(u+1,N):
          #if dm[u,w] <= N:
          for s in range(0,N):
            if (s != u) and (s != w):
              if (dm[u,s] + dm[s,w] == dm[u,w]):
                model.addConstr(x[u] + x[w] >= x[s])

      #model.write(f"{method_}_{form_}_{inst_}_{id_}.lp")

      if method_ != "mip":
        relax = model.relax()
        relax.optimize()
      else:
        model.optimize()

      tmp = 0
      if model.status == GRB.OPTIMAL:
        tmp = 1

      if (method_=="mip"):
        lb[i] = model.objBound
        ub[i] = model.objVal
        gap[i] = model.MIPGap
        time[i] = model.Runtime
        nodes[i] = model.NodeCount
        status[i] = tmp
      else:
        ub[i] = model.objVal
        time[i] = model.Runtime
        status[i] = tmp

    if (method_=="mip"):
      arquivo = open(
        os.path.join(RESULT_PATH,instance),'a'
      )
      tmp = i
      arquivo.write(
        str(tmp)+';'
        +str(round(lb[i],1))+';'
        +str(round(ub[i],1))+';'
        +str(round(gap[i],2))+';'
        +str(round(time[i],2))+';'
        +str(round(nodes[i],1))+';'
        +str(round(status[i],1))+'\n'
      )
      arquivo.close()
    else:
      arquivo = open(
        os.path.join(RESULT_PATH,instance),'a'
      )
      tmp = i
      arquivo.write(
        str(tmp)+';'
        +str(round(ub[i],1))+';'
        +str(round(time[i],2))+';'
        +str(round(status[i],1))+'\n'
      )
      arquivo.close()
        
    model.dispose()

  # end tukey for node i

if __name__ == "__main__":
  
  for id_ in range(1,11):
    #print("instance %d" %(id_))
    inst_="internet_graph"
    dim_=200
    G = nx.read_gml(f"../instances/{inst_}/{dim_}/{inst_}_{dim_}_{id_}.gml.gz",destringizer=int)

    method_="mip"
    form_="fmin"
    instance = f"{method_}_{form_}_{inst_}_{dim_}_{id_}.txt"
    tukey_min(method_,form_,inst_,id_,instance,G)
    #tukey_max(method_,form_,inst_,id_,instance,G)
    #tukey_max_miset(method_,form_,inst_,id_,instance,G)
    #tukey_max_neighb(method_,form_,inst_,id_,instance,G)

    G.clear()  