from pathlib import Path
import os
import networkx as nx
import numpy as np

import gurobipy as gp
from gurobipy import GRB

import fgraphs as fg
import time as trun
import igraph as ig

def tukey_fmax_c0_noclique(method_,instance_,G,result_path):
    
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

        model = gp.Model(f"{instance_}")

        # configurando parametros
        model.Params.TimeLimit = 600
        model.Params.MIPGap = 1.e-6
        model.Params.Threads = 1
        #model.Params.Presolve = 0
        #model.Params.Cuts = 0

        if (method_=="mip"):
            x = model.addVars(N, vtype=GRB.BINARY, name="x")
        else:
            x = model.addVars(N, lb=0.0, ub=1.0, vtype=GRB.CONTINUOUS, name="x")
   
        obj = 0
        for j in G:
            obj += 1 * x[j]
         
        model.setObjective(obj, GRB.MAXIMIZE)
     
        # Turn off display and heuristics
        #gp.setParam('OutputFlag', 0)
        #gp.setParam('Heuristics', 0)

        model.addConstr(x[i] == 0)

        # geodesic c0
        for u in range(0,N):
            for w in range(0,N):
                #if dm[u,w] <= N:
                for s in range(0,N):
                    if (s != u) and (s != w):
                        if (dm[u,s] + dm[s,w] == dm[u,w]):
                            model.addConstr(x[u] + x[w] <= 1 + x[s], "geo_c0_noclique")

        #model.write(f"{instance_}_{i}.lp")

        model.optimize()

        tmp = 0
        if model.status == GRB.OPTIMAL:
            tmp = 1

        if method_ == "mip":
            lb[i] = N - model.objBound
            ub[i] = N - model.objVal
            gap[i] = model.MIPGap
            time[i] = model.Runtime
            nodes[i] = model.NodeCount
            status[i] = tmp
        else:
            ub[i] = N - model.objVal
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

