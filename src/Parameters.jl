module Parameters

struct ParameterData
  #instName::String
  solver::String
  method::String
  maxtime::Int
  tolgap::Float64
  disablesolver::Int
  maxnodes::Int

  #horsizerf::Int
  #fixsizerf::Int
  #maxtimerf::Int
  #tolgaprf::Float64
  #freeintervalr::Int

  #horsizefo::Int
  #fixsizefo::Int
  #maxhorsizefo::Int
  #maxfixsizefo::Int
  #maxtimefo::Int
  #tolgapfo::Float64

end

export ParameterData, readInputParameters

function readInputParameters(ARGS)

  ### Set standard values for the parameters ###
  #instName = "instances/csifa/c52_1.txt"
  solver = "gurobi"
  method = "exact"
  maxtime = 3600
  tolgap = 1e-6
  disablesolver = 0
  maxnodes = 10000000.0

  #horsizerf = 3
  #fixsizerf = 2
  #maxtimerf = 360
  #tolgaprf = 1e-6
  #freeintervalr = 2
  
  #horsizefo = 3
  #maxhorsizefo = 3
  #fixsizefo = 2
  #maxfixsizefo = 2
  #maxtimefo = 360
  #tolgapfo = 1e-6

  ### Read the parameters and setvalues whenever provided ###
  for param in 1:length(ARGS)
    #if ARGS[param] == "--inst"
    #  instName = ARGS[param+1]
    #  param += 1
    if ARGS[param] == "--solver"
      solver = ARGS[param+1]
      param += 1
    elseif ARGS[param] == "--method"
      method = ARGS[param+1]
      param += 1
    elseif ARGS[param] == "--maxtime"
      maxtime = parse(Int,ARGS[param+1])
      param += 1
    elseif ARGS[param] == "--tolgap"
      tolgap = parse(Float64,ARGS[param+1])
      param += 1
    elseif ARGS[param] == "--disablesolver"
      disablesolver = parse(Int,ARGS[param+1])
      param += 1
    elseif ARGS[param] == "--maxnodes"
      maxnodes = parse(Float64,ARGS[param+1])
      param += 1
    #elseif ARGS[param] == "--horsizerf"
    #  horsizerf = parse(Int,ARGS[param+1])
    #  param += 1
    #elseif ARGS[param] == "--fixsizerf"
    #  fixsizerf = parse(Int,ARGS[param+1])
    #  param += 1
    #elseif ARGS[param] == "--maxtimerf"
    #  maxtimerf = parse(Int,ARGS[param+1])
    #  param += 1
    #elseif ARGS[param] == "--tolgaprf"
    #  tolgaprf = parse(Float64,ARGS[param+1])
    #  param += 1
    #elseif ARGS[param] == "--horsizefo"
    #  horsizefo = parse(Int,ARGS[param+1])
    #  param += 1
    #elseif ARGS[param] == "--fixsizefo"
    #  fixsizefo = parse(Int,ARGS[param+1])
    #  param += 1
    #elseif ARGS[param] == "--maxhorsizefo"
    #  maxhorsizefo = parse(Int,ARGS[param+1])
    #  param += 1
    #elseif ARGS[param] == "--maxfixsizefo"
    #  maxfixsizefo = parse(Int,ARGS[param+1])
    #  param += 1
    #elseif ARGS[param] == "--maxtimefo"
    #  maxtimefo = parse(Int,ARGS[param+1])
    #  param += 1
    #elseif ARGS[param] == "--tolgapfo"
    #  tolgapfo = parse(Float64,ARGS[param+1])
    end
  end

  params = ParameterData(
    #instName,
    solver,
    method,
    maxtime,
    tolgap,
    disablesolver,
    maxnodes
    #horsizerf, 
    #fixsizerf,
    #maxtimerf, 
    #tolgaprf,
    #freeintervalr,
    #horsizefo, 
    #fixsizefo, 
    #maxhorsizefo, 
    #maxfixsizefo, 
    #maxtimefo, 
    #tolgapfo
  )

  return params

end 

end
