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

import tukey_fmin_c1 as fmin_c1
import tukey_fmin_c2 as fmin_c2
import tukey_fmin_miset as fminmiset
import tukey_fmin_miset_c2 as fminmiset_c2
import tukey_fmin_miset_c3 as fminmiset_c3
import tukey_fmin_c0 as fmin_c0
import tukey_fmin_c0_noclique as fmin_c0noclq
import tukey_fmin_c1_noclique as fmin_c1noclq

import tukey_fmax_c1 as fmax_c1
import tukey_fmax_c2 as fmax_c2
import tukey_fmax_miset as fmaxmiset
import tukey_fmax_miset_c2 as fmaxmiset_c2
import tukey_fmax_miset_c3 as fmaxmiset_c3
import tukey_fmax_c0 as fmax_c0
import tukey_fmax_c0_noclique as fmax_c0noclq
import tukey_fmax_c1_noclique as fmax_c1noclq

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
    
	if form_ == "fminc1":
		fmin_c1.tukey_fmin_c1(method_,instance_,G,result_path)
	elif form_ == "fminc2":
		fmin_c2.tukey_fmin_c2(method_,instance_,G,result_path)
	elif form_ == "fminmiset":
		fminmiset.tukey_fmin_miset(method_,instance_,G,result_path)
	elif form_ == "fminmisetc2":
		fminmiset_c2.tukey_fmin_miset_c2(method_,instance_,G,result_path)
	elif form_ == "fminmisetc3":
		fminmiset_c3.tukey_fmin_miset_c3(method_,instance_,G,result_path)
	elif form_ == "fminc0":
		fmin_c0.tukey_fmin_c0(method_,instance_,G,result_path)
	elif form_ == "fminc0noclq":
		fmin_c0noclq.tukey_fmin_c0_noclique(method_,instance_,G,result_path)
	elif form_ == "fminc1noclq":
		fmin_c1noclq.tukey_fmin_c1_noclique(method_,instance_,G,result_path)
	elif form_ == "fmaxc1":
		fmax_c1.tukey_fmax_c1(method_,instance_,G,result_path)
	elif form_ == "fmaxc2":
		fmax_c2.tukey_fmax_c2(method_,instance_,G,result_path)
	elif form_ == "fmaxmiset":
		fmaxmiset.tukey_fmax_miset(method_,instance_,G,result_path)
	elif form_ == "fmaxmisetc2":
		fmaxmiset_c2.tukey_fmax_miset_c2(method_,instance_,G,result_path)
	elif form_ == "fmaxmisetc3":
		fmaxmiset_c3.tukey_fmax_miset_c3(method_,instance_,G,result_path)
	elif form_ == "fmaxc0":
		fmax_c0.tukey_fmax_c0(method_,instance_,G,result_path)
	elif form_ == "fmaxc0noclq":
		fmax_c0noclq.tukey_fmax_c0_noclique(method_,instance_,G,result_path)
	elif form_ == "fmaxc1noclq":
		fmax_c1noclq.tukey_fmax_c1_noclique(method_,instance_,G,result_path)
	else:
		print("parameters errado!")
  
	G.clear()
