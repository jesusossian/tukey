import urllib.request
import io
import zipfile

from pathlib import Path
import os

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import gurobipy as gp
from gurobipy import GRB

import networkx as nx
import igraph as ig

def form0():
  # form0
  form_="form0"
  method_="mip"

  N = nx.number_of_nodes(G)
  M = nx.number_of_edges(G)

  lb = np.zeros((N), dtype=float)
  ub = np.zeros((N), dtype=float)
  time = np.zeros((N), dtype=float)
  gap = np.zeros((N), dtype=float)
  nodes = np.zeros((N), dtype=float)
  status_ = np.zeros((N), dtype=float)

  RESULT_PATH   = Path('../result/')

  for i in G:

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

    constr0 = 0
    constr0 += 1*x[i]
    model.addConstr(constr0 == 1)

    for u in range(0,N):
        for w in range(u+1,N):
            if dm[u,w] <= N:
                for s in range(0,N):
                    if (s != u) and (s != w):
                        if (dm[u,s] + dm[s,w] == dm[u,w]):
                            constr1 = x[u] + x[w]
                            model.addConstr(constr1 >= x[s])

    #x[i].Start = 1.0
    #relax = model.relax()    
    #relax.optimize()
    
    #model.write(f"{method_}_{inst_}_{form_}.lp")

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
      status_[i] = tmp
    else:
      ub[i] = model.objVal
      time[i] = model.Runtime
      status_[i] = tmp

    if (method_=="mip"):
      arquivo = open(os.path.join(RESULT_PATH,f"{method_}_tukey_{inst_}_{form_}.txt"),'a')
      tmp = i
      arquivo.write(
        str(tmp)+';'
        +str(round(lb[i],1))+';'
        +str(round(ub[i],1))+';'
        +str(round(gap[i],2))+';'
        +str(round(time[i],2))+';'
        +str(round(nodes[i],1))+';'
        +str(round(status_[i],1))+'\n')
      arquivo.close()
    else:
      arquivo = open(os.path.join(RESULT_PATH,f"{method_}_tukey_{inst_}_{form_}.txt"),'a')
      tmp = i
      arquivo.write(
        str(tmp)+';'
        +str(round(ub[i],1))+';'
        +str(round(time[i],2))+';'
        +str(round(status_[i],1))+'\n')
      arquivo.close()

def random_internet():

  inst_="random_internet_100"
  dim=100
  G = nx.random_internet_as_graph(dim)

  N = nx.number_of_nodes(G)
  M = nx.number_of_edges(G)

  dm = np.zeros((N,N), dtype=int)

  p = nx.shortest_path(G)
  for i in range(0,N):
    for j in range(0,N):
        dm[i][j] = len(p[i][j])-1

#G.edges

  model = gp.Model("tukey") #cria o modelo

  x = model.addVars(N, vtype=GRB.BINARY, name='x') #Adicionando Variáveis 

  obj = None
  for  in range(0, n):
    obj += p[i][i] * x[i]
    for j in range(i+1, n):
      obj += p[i][j] * y[i,j]

  model.setObjective(obj, GRB.MAXIMIZE)

  constr0 = None
  for j in range(0, n):
    constr0 += (w[j] * x[j])
  model.addConstr(constr0 <= c)

  for i in range(0,n):
    for j in range(i+1, n):
      constr1 = y[i,j]
      model.addConstr(constr1 <= x[i])

  for i in range(0,n):
    for j in range(i+1, n):
      constr2 = y[i,j]
      model.addConstr(constr2 <= x[j])

#  for i in range(0,n):
#    for j in range(i+1, n):
#      constr3 = x[i] + x[j]
#      model.addConstr(constr3 <= 1 + y[i,j])

  model.write("qkp_lin.lp")

  # configurando parametros
  #model.Params.IterationLimit = 1000 # define o número de iterações do simplex
  #model.Params.TimeLimit = 60 # define tempo limite
  model.Params.MIPGap = 0.001 # define valor do gap
  #model.Params.method = 1
  #model.Params.NodeMethod = -1 #  -1=automatic, 0=primal simplex, 1=dual simplex, and 2=barrier
  model.Params.Threads = 1
  model.Params.Presolve = 0
  model.Params.Cuts = 0
#  model.Params.PreCrush = 1

  # Turn off display and heuristics
  #gp.setParam('OutputFlag', 0)
  #gp.setParam('Heuristics', 0)

  # Open log file
  logfile = open('cb.log', 'w')
 
  # Pass data into my callback function
  model._lastiter = -GRB.INFINITY
  model._lastnode = -GRB.INFINITY
  model._logfile = logfile
  model._vars = model.getVars()

#  model.optimize(mycallback)
  model.optimize()


  #print('Obj: %g' % obj.getValue())
  
  print('')
  print('Optimization complete')
  if model.SolCount == 0:
    print('No solution found, optimization status = %d' % model.Status)
  else:
    print('Solution found, objective = %g' % model.ObjVal)
#    for v in model.getVars():
#      if v.X != 0.0:
#        print('%s %g' % (v.VarName, v.X))

  print('solução viável: ', round(model.objVal,2))
  print('bound: ', round(model.objBound,2))
  print('tempo: ', round(model.Runtime,2))
  print('gap: ', round(model.MIPGap,2))
  print('iterações: ', round(model.IterCount,2))
  print('Número de vértices: ', round(model.NodeCount,2))

if __name__ == "__main__":

  tukey()