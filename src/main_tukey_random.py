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
import tukey_min as min
import tukey_max_miset as maxmiset
import tukey_min_miset as minmiset

if __name__ == "__main__":

  if len(sys.argv) < 2:
    print("digite dados!")
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
    
  if form_ == "fmin":
    min.tukey_min(method_,instance_,G,result_path)
  elif form_ == "fmax":
    max.tukey_max(method_,instance_,G,result_path)
  elif form_ == "minmiset":
    minmiset.tukey_min_miset(method_,instance_,G,result_path)
  elif form_ == "maxmiset":
    maxmiset.tukey_max_miset(method_,instance_,G,result_path)
  elif form_ == "minmiset0":
    minmiset.tukey_min_miset_v0(method_,instance_,G,result_path)
  elif form_ == "minmiset1":
    minmiset.tukey_min_miset_v1(method_,instance_,G,result_path)
  else:
    print("parameters errado!")
  
  G.clear()  