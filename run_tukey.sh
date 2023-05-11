#!/bin/bash

method_=rf
solver_=gurobi # cplex
inst_="karate"

julia tukey.jl --method ${method_} --solver ${solver_} >> report/out_${inst_}_${method_}.txt
mv solution.txt result/${inst_}_${method_}.txt
