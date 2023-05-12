import sys
import numpy as np
import gurobipy as gp
from gurobipy import GRB
import networkx as nx


def tukey():

  G = nx.karate_club_graph()

  N = 34

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