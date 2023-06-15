from pathlib import Path
import os
import networkx as nx
import numpy as np
import gurobipy as gp
from gurobipy import GRB
import fgraphs as fg
from itertools import combinations
import time as trun
import igraph as ig

def tukey_fmin_miset_c2(method_,instance_,G,result_path):
  
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

  for i in G:
    #begin tukey node i
    #print("node %d" %i)
    
    Ni = nx.neighbors(G,i)

    listNi = []
    for j in Ni:
      listNi.append(j)

    tstart = trun.time()
    status_clique = fg.is_subclique(G, listNi)
    tend = trun.time()

    elapsed_time = tend - tstart
    
    if(status_clique):
      # if clique
      #print("tukey[%d] = 1" %i)
      lb[i] = 1
      ub[i] = 1
      gap[i] = 0.0
      time[i] = elapsed_time
      nodes[i] = 0
      status[i] = 1
    else:
      # if not clique
      model = gp.Model(f"{instance_}")

      if (method_=="mip"):
        x = model.addVars(N, vtype=GRB.BINARY, name="x")
      else:
        x = model.addVars(N, lb=0.0, ub=1.0, vtype=GRB.CONTINUOUS, name="x")
        
      # configurando parametros
      model.Params.TimeLimit = 600
      model.Params.MIPGap = 1.e-6
      model.Params.Threads = 1
      #model.Params.Presolve = 0
      #model.Params.Cuts = 0
 
      # Turn off display and heuristics
      #gp.setParam('OutputFlag', 0)
      #gp.setParam('Heuristics', 0)

      obj = 0
      for j in G:
        obj += 1 * x[j]
         
      model.setObjective(obj, GRB.MINIMIZE)

      model.addConstr(x[i] == 1, "fix_x")

      # geodesic neighbors
      for u in range(0,N):
        Nu = nx.neighbors(G,u)
            
        listNu = []
        for j in Nu:
          listNu.append(j)

        for w in range(u+1,N):
          if (w != u) and (w not in listNu):
            for s in listNu:
              if (s != w) and (dm[u,s] + dm[s,w] == dm[u,w]):
                  model.addConstr(x[u] + x[w] >= x[s], "geo_c2")

      # maximal independent set
      for u in range(0,N):
        Nu = nx.neighbors(G,u)

        listNu = []
        for j in Nu:
          listNu.append(j)

        count = 0
        dicl = {}
        for it in listNu:
          dicl[count] = it
          count += 1

        T = nx.Graph()
        T.add_nodes_from(listNu)
        for (a,b) in combinations(listNu,2):
          if G.has_edge(a,b):
            T.add_edge(a,b)

        #nx.draw(T,  with_labels = True)

        A = ig.Graph.from_networkx(T)
        #Im = nx.maximal_independent_set(T)
        Im = A.maximal_independent_vertex_sets()

        tmp = len(Im)
        if (tmp > 0):
          #print("dim Im: %d" %(tmp))
          for itIm in Im:
            #print(itIm)
            constr = 0
            for j in itIm:
              #print(dicl[j])
              constr += 1 * x[dicl[j]]
            model.addConstr(constr >= (len(itIm) - 1)*x[u], "miset_c2")

        T.clear()

      #model.write(f"{instance_}.lp")

      model.optimize()

      tmp = 0
      if model.status == GRB.OPTIMAL:
        tmp = 1
 
      if method_ == "mip":
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

      model.dispose()

      # end tukey for node i
  
  for i in G:
    if (method_=="mip"):
      arquivo = open(os.path.join(result_path,instance_),'a')
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
      arquivo = open(os.path.join(result_path,instance_),'a')
      tmp = i
      arquivo.write(
        str(tmp)+';'
        +str(round(ub[i],1))+';'
        +str(round(time[i],2))+';'
        +str(round(status[i],1))+'\n'
      )
      arquivo.close()

  #G.clear()