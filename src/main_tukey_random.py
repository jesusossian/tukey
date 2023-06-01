import urllib.request
import io
import zipfile

from pathlib import Path
import os

import matplotlib.pyplot as plt
import networkx as nx
import numpy as np
import pandas as pd
import gurobipy as gp
from gurobipy import GRB

import igraph as ig

from itertools import combinations

import sys
from datetime import datetime, date

RESULT_PATH   = Path('../result/')

import tukey_max as max
import tukey_max_neighb as max_neighb
import tukey_min as min
import tukey_max_miset as miset

if __name__ == "__main__":

  if len(sys.argv) < 2:
    print("Default data : ")
  else:
    data_ = sys.argv[1]
    method_ = sys.argv[2]
    form_ = sys.argv[3]
    inst_ = sys.argv[4]
    dim_ = sys.argv[5]
    id_ = sys.argv[6]
 
  G = nx.read_gml(data_,destringizer=int)

  instance_ = f"{method_}_{form_}_{inst_}_{dim_}_{id_}.txt"

  result_path = Path(f"../result/{inst_}")

#  for id_ in range(1,6):
#    #print("instance %d" %(id_))
#    inst_="internet_graph"
#    dim_=200
#    G = nx.read_gml(f"../instances/{inst_}/{dim_}/{inst_}_{dim_}_{id_}.gml.gz",destringizer=int)

#    method_="mip"
#    form_="fmax"
#    instance = f"{method_}_{form_}_{inst_}_{dim_}_{id_}.txt"
    
  if form_ == "fmin":
    min.tukey_min(method_,instance_,G,result_path)
  elif form_ == "fmax":
    max.tukey_max(method_,instance_,G,result_path)
  elif form_ == "miset":
    miset.tukey_max_miset(method_,instance_,G,result_path)
  elif form_ == "neighb":
    max_neighb.tukey_max_neighb(method_,instance_,G,result_path)

    G.clear()  