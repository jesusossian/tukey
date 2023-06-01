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

import tukey_max as max
import tukey_max_miset as miset
import tukey_max_neighb as neighb
import tukey_min as min

#RESULT_PATH   = Path('../result/')

if __name__ == "__main__":

  if len(sys.argv) < 1:
    print("Default data file : ")
  else:
    data_ = sys.argv[1]
    method_ = sys.argv[2]
    form_ = sys.argv[3]
    inst_ = sys.argv[4]
  
    result_path = Path(f"../result/{inst_}")

#  inst_="internet_graph"
#  G = nx.read_gml(f"../instances/{inst_}/{inst_}.gml.gz",destringizer=int)
  G = nx.read_gml(data_,destringizer=int)

  #method_ = "mip"
  #form_ = "fmin"
  instance_ = f"{method_}_{form_}_{inst_}.txt"
  
  if form_ == "fmin":
    min.tukey_min(method_,instance_,G,result_path)
  elif form_ == "fmax":
    max.tukey_max(method_,instance_,G,result_path)
  elif form_ == "miset":
    miset.tukey_max_miset(method_,instance_,G,result_path)
  elif form_ == "neighb":
    neighb.tukey_max_neighb(method_,instance_,G,result_path)
  else:
    print("parameters errado!")

  G.clear()