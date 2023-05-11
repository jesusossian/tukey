push!(LOAD_PATH, "src/")
#push!(DEPOT_PATH, JULIA_DEPOT_PATH)

#using Pkg
#Pkg.activate(".")
#Pkg.instantiate()
#Pkg.build()

using JuMP
using Gurobi
using CPLEX

import Data
import Parameters
import exact
import relax_and_fix

params = Parameters.readInputParameters(ARGS)

### julia tukey.jl  

### read instance data
#inst = Data.readData(params.instName, params)

if (params.method == "exact")
    exact.tukey_exact(params)
elseif (params.method == "rf")
    relax_and_fix.main_rf(params)
end
