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

import tukey_fmin as fmin
import tukey_fmin_miset as fminmiset
import tukey_fmin_miset_n0 as fminmiset_n0
import tukey_fmin_miset_n1 as fminmiset_n1

import tukey_fmax as fmax
import tukey_fmax_miset_n0 as fmaxmiset_n0

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
    fmin.tukey_fmin(method_,instance_,G,result_path)
  elif form_ == "fmax":
    fmax.tukey_fmax(method_,instance_,G,result_path)
  elif form_ == "fminmiset":
    fminmiset.tukey_fmin_miset(method_,instance_,G,result_path)
  elif form_ == "fmaxmisetn0":
    fmaxmiset_n0.tukey_fmax_miset_n0(method_,instance_,G,result_path)
  elif form_ == "fminmisetn0":
    fminmiset_n0.tukey_fmin_miset_n0(method_,instance_,G,result_path)
  elif form_ == "fminmisetn1":
    fminmiset_n1.tukey_fmin_miset_n1(method_,instance_,G,result_path)
  else:
    print("parameters errado!")
  
  G.clear()  