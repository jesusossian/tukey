# exact method

module exact

using Data
using Parameters

using JuMP
using Gurobi
using CPLEX
using Graphs
using GraphRecipes
using GraphPlot
using Graphs:smallgraph

mutable struct stdFormVars
  x
end

export tukey_exact, stdFormVars

function tukey_exact(params::ParameterData)

  #N = inst.N
  
  g = smallgraph(:karate)
  
  N = nv(g)
  
  dm = zeros(Int64,N,N)
  
  for i in 1:N
  	ds = dijkstra_shortest_paths(g,i,allpaths=false);
  	for j in 1:N
    	dm[i,j] = ds.dists[j]
  	end
  end

  for i in 1:N 

    ### select solver and define parameters ###
    if params.solver == "gurobi"
      model = Model(Gurobi.Optimizer)
      set_optimizer_attribute(model,"TimeLimit",params.maxtime)
      set_optimizer_attribute(model,"MIPGap",params.tolgap)
      set_optimizer_attribute(model,"NodeLimit",params.maxnodes)
      #set_optimizer_attribute(model,"NodeMethod",0)
      #set_optimizer_attribute(model,"Method",-1)
      set_optimizer_attribute(model,"Threads",1)
    elseif params.solver == "cplex"
      model = Model(CPLEX.Optimizer)
      set_optimizer_attribute(model,"CPX_PARAM_TILIM",params.maxtime)
      set_optimizer_attribute(model,"CPX_PARAM_EPGAP",params.tolgap)
      #set_optimizer_attribute(model,"CPX_PARAM_LPMETHOD ",0)
      set_optimizer_attribute(model,"CPX_PARAM_NODELIM",params.maxnodes)
      set_optimizer_attribute(model,"CPX_PARAM_THREADS",1)
    else
      println("No solver selected")
      return 0
    end

    @variable(model, x[j=1:N], Bin)
      
    @objective(model, Min, sum(x[j] for j in 1:N))

    @constraint(model, x[i] == 1)

    for u in 1:N
      for w in (u+1):N
        if dm[u,w] <= N
          for s in 1:N
            if (s != u) && (s != w)
              if (dm[u,s] + dm[s,w] == dm[u,w])
                @constraint(model, x[u] + x[w] >= x[s])
              end
            end
          end
        end
      end
    end

    ### lp problem
    #relax_integrality(model)

    ### export .lp
    write_to_file(model,"tukey.lp")

    ### solving the problem
    optimize!(model)

    opt = 0
    if termination_status(model) == MOI.OPTIMAL
      println("status = ", termination_status(model))
      opt = 1
    else
      println("status = ", termination_status(model))
    end
  
    ### get solutions ###
  
    bestbound = objective_bound(model)
    numnodes = node_count(model)
    gap = MOI.get(model, MOI.RelativeGap())
    bestsol = objective_value(model)
    time = solve_time(model)

    #### print results ###
    open("solution.txt","a") do f
      write(f,"$(i);$(bestbound);$(bestsol);$(gap);$(time);$(numnodes);$(opt)\n")
    end  
  
  end

end

end
