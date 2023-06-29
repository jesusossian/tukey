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

def tukey_fmin_rf_c2(instance_,G,result_path):
  
    N = nx.number_of_nodes(G)
    M = nx.number_of_edges(G)

    dm = np.zeros((N,N), dtype=int)

    p = nx.shortest_path(G)

    for i in range(0,N):
        for j in range(0,N):
            dm[i][j] = len(p[i][j])-1

    lb = np.zeros((N), dtype=float)
    ub = np.zeros((N), dtype=float)
    timer = np.zeros((N), dtype=float)
    gap = np.zeros((N), dtype=float)
    nodes = np.zeros((N), dtype=float)
    status = np.zeros((N), dtype=float)
    
    x_sol = [0]*N

    for i in G:
        
        #if (i>23):
        #    continue

        print("########### node %d ###########" %i)
    
        Ni = nx.neighbors(G,i)

        listNi = []
        for j in Ni:
            listNi.append(j)

        startclq = trun.time()
        status_clique = fg.is_subclique(G, listNi)
        endclq = trun.time()
        elapsedt_clq = endclq - startclq
    
        if(status_clique):
            #print("tukey[%d] = 1" %i)
            lb[i] = 1
            ub[i] = 1
            gap[i] = 0.0
            timer[i] = elapsedt_clq
            nodes[i] = 0
            status[i] = 1
        else:
        
            time_rf = 0.0
            
            model = gp.Model(f"{instance_}")

            x = model.addVars(N,lb=0.0,ub=1.0,vtype=GRB.BINARY,name="x")
            #x = model.addVars(N,lb=0.0,ub=1.0,vtype=GRB.CONTINUOUS,name="x")
                    
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

            # maximal independent set
            for u in range(0,N):
            
                Nu = nx.neighbors(G,u)

                listNu = []
                for j in Nu:
                    listNu.append(j)

                # geodesic c2
                for w in range(u+1,N):
                    if (w != u) and (w not in listNu):
                        for s in listNu:
                            if (s != w) and (dm[u,s] + dm[s,w] == dm[u,w]):
                                model.addConstr(x[u] + x[w] >= x[s], "geo_c2")

            #model.write(f"{instance_}.lp")
                
            # set k and kprime according to the initial parameters
            k = 3 #horsizerf
            kprime = 2 #fixsizerf
                
            alpha = 0
            beta = min(alpha+k-1,N-1)

            for j in range(N):
                if j != i:
                    x[j].VType = gp.GRB.CONTINUOUS
                             
            while beta < N:
                print("alpha = %d , beta = %d" %(alpha, beta))

                # fix valor variables
                if alpha > 0:
                    for j in range(0,alpha):
                        if (j != i):
                            x[j].lb = x_sol[j]
                            x[j].ub = x_sol[j]
                                
                # set binary variables
                for j in range(alpha,beta):
                    if (j != i):# and (x[j].VType != gp.GRB.BINARY):
                        x[j].VType = gp.GRB.BINARY
                        x[j].lb = 0.0
                        x[j].ub = 1.0
                    
                # relax binary variables    
                for j in range(beta,N):
                    if (j != i):# and (x[j].VType != gp.GRB.CONTINUOUS):
                        x[j].VType = gp.GRB.CONTINUOUS    
                        x[j].lb = 0.0
                        x[j].ub = 1.0

                model.update()

                #startrf = trun.time()
                
                model.optimize()
                
                #endrf = trun.time()
                #elapsedt_rf = endrf - startrf
                #time_rf += elapsedt_rf
                
                time_rf += model.Runtime

                objval = model.objBound
                x_sol = [x[j].X for j in range(N)]

                alpha = alpha+kprime
                if (beta == N-1):
                    beta = N
                else:
                    beta = min(alpha+k-1,N-1)
                                       
                #tmp = 0
                #if (model.status == GRB.OPTIMAL):
                #    tmp = 1

            #lb[i] = model.objBound
            ub[i] = objval
            #gap[i] = model.MIPGap
            timer[i] = time_rf #model.Runtime
            #nodes[i] = model.NodeCount
            #status[i] = tmp

            #model.dispose()

        # end tukey for node i
  
    for i in G:
        arquivo = open(os.path.join(result_path,instance_),'a')
        tmp = i
        arquivo.write(
            str(tmp)+';'
    #        +str(round(lb[i],1))+';'
            +str(round(ub[i],1))+';'
            #+str(round(gap[i],2))+';'
            +str(round(timer[i],2))+'\n'
            #+str(round(nodes[i],1))+';'
            #+str(round(status[i],1))+'\n'
        )
        arquivo.close()
