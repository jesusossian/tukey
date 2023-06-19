module Data

using Statistics
using Random

struct InstanceData
  N::Int
end

export InstanceData, readData

function readData(instanceFile,params)
  
  file = open(instanceFile)
  fileText = read(file, String)
  tokens = split(fileText) 

  # read the problem's dimensions N
  aux = 1
  N = parse(Int,tokens[aux])

  close(file)

  inst = InstanceData(N)

  return inst

end

end
