# exact method

module relax_and_fix

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

export tukey_rf, stdFormVars

function main_rf(params)
  
  relax_and_fix.tukey_rf(params)
  
end


function tukey_rf(params::ParameterData)

  if params.maxtimerf < 3600
    maxtimerf = params.maxtimerf
  else
    maxtimerf = 300
  end
 
  g = smallgraph(:karate)
  
  N = nv(g)
  
  dm = zeros(Int64,N,N)
  
  for i in 1:N
  	ds = dijkstra_shortest_paths(g,i,allpaths=false);
  	for j in 1:N
    	dm[i,j] = ds.dists[j]
  	end
  end

  ##Defining number of subproblems and maximum time for executing them
  nbsubprob = ceil(N/params.fixsizerf)
  maxtimesubprob = params.maxtimerf/nbsubprob

  for i in 1:N

    xsol = zeros(Int,N)
    xv = zeros(Int,N)

    ### select solver and define parameters ###
    if params.solver == "gurobi"
      model = Model(Gurobi.Optimizer)
      set_optimizer_attribute(model,"TimeLimit",params.maxtimerf)
      set_optimizer_attribute(model,"MIPGap",params.tolgaprf)
      set_optimizer_attribute(model,"Threads",1)
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

    # set k and kprime according to the initial parameters
    k = params.horsizerf
    kprime = params.fixsizerf

    time = 0.0
    alpha = 1
    beta = min(alpha+k-1, N)

    for t in 1:N
      if (t != i)
        unset_binary(x[t])
      end
    end

    while (beta <= N)

      t1 = time_ns()

      if (alpha > 1)
        # fix x
        for t in 1:(alpha-1)
          if xv[t] >= 0.9 + 1.e-6
            set_lower_bound(x[t],1.0)
          else
            set_upper_bound(x[t],0.0)
          end
        end
      end

      # set binary variables
      for t in alpha:beta
        set_binary(x[t])
      end

      # relax binary variables    
      for t in beta+1:N
        if ((is_binary(x[t]) == true) && (t != i))
          unset_binary(x[t])
          set_lower_bound(x[t],0.0)
          set_upper_bound(x[t],1.0)
        end
      end

      optimize!(model)
      xv = value.(x)

      alpha = alpha+kprime
      if (beta == N)
        beta = N+1
      else
        beta = min(alpha+k-1,N)
      end

      t2 = time_ns()
      time += (t2-t1)/1.0e9

    end

    bestsol = objective_value(model)
    xsol = value.(x)

    open("solution.txt","a") do f
      write(f,"$(i);$(bestsol);$(time)\n")
    end

  end

end

end