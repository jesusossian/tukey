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


def tukey():

  #instance
  #inst_="internet_graph"
  #dim_=100
  #id_=1
  #G = nx.read_gml(f"../instances/{inst_}/{dim_}/{inst_}_{dim_}_{id_}.gml.gz",destringizer=int)

  inst_="karate"
  G = nx.karate_club_graph()

  N = nx.number_of_nodes(G)
  M = nx.number_of_edges(G)

  dm = np.zeros((N,N), dtype=int)

  p = nx.shortest_path(G)

  for i in range(0,N):
     for j in range(0,N):
        dm[i][j] = len(p[i][j])-1

  # fmin
  form_="fmin"
  method_="mip"


  lb = np.zeros((N), dtype=float)
  ub = np.zeros((N), dtype=float)
  time = np.zeros((N), dtype=float)
  gap = np.zeros((N), dtype=float)
  nodes = np.zeros((N), dtype=float)
  status = np.zeros((N), dtype=float)

  RESULT_PATH   = Path('../result/')
  #instance = f"{method_}_{form_}_{inst_}_{dim_}_{id_}.txt"
  instance = f"{method_}_{form_}_{inst_}.txt"

  for i in G: # begin tukey node i

    print("node %d" %i)
    
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

      model = gp.Model(f"{method_}_{inst_}_{form_}")

      if (method_=="mip"):
        x = model.addVars(N, vtype=GRB.BINARY, name="x")
      else:
        x = model.addVars(N, lb=0.0, ub=1.0, vtype=GRB.CONTINUOUS, name="x")
    
      obj = 0
      for j in G:
        obj += 1 * x[j]
         
      model.setObjective(obj, GRB.MINIMIZE)
    
      # configurando parametros
      # model.Params.TimeLimit = 60
      model.Params.MIPGap = 1.e-6
      model.Params.Threads = 1
      # model.Params.Presolve = 0
      # model.Params.Cuts = 0
 
      # Turn off display and heuristics
      gp.setParam('OutputFlag', 0)
      gp.setParam('Heuristics', 0)

      model.addConstr(x[i] == 1)

      for u in range(0,N):
        for w in range(u+1,N):
          #if dm[u,w] <= N:
          for s in range(0,N):
            if (s != u) and (s != w):
              if (dm[u,s] + dm[s,w] == dm[u,w]):
                model.addConstr(x[u] + x[w] >= x[s])

      #x[i].Start = 1.0
      #relax = model.relax()    
      #relax.optimize()
    
      #model.write(f"{method_}_{form_}_{inst_}_{id_}.lp")

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
    
  # end tukey for node i

#  tkm = np.sum(ub)
#  tktime = np.sum(time)

if __name__ == "__main__":

  tukey()