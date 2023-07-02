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

import tukey_fmax_c1 as fmax_c1
import tukey_fmax_c2 as fmax_c2
import tukey_fmax_miset as fmaxmiset
import tukey_fmax_miset_c2 as fmaxmiset_c2
import tukey_fmax_miset_c3 as fmaxmiset_c3
import tukey_fmax_c0 as fmax_c0
import tukey_fmax_c0_noclique as fmax_c0noclq
import tukey_fmax_c1_noclique as fmax_c1noclq

if __name__ == "__main__":

	if len(sys.argv) < 1:
		print("digite dados!")
	else:
		data_ = sys.argv[1]
		method_ = sys.argv[2]
		form_ = sys.argv[3]
		inst_ = sys.argv[4]

	G = nx.read_gml(data_,destringizer=int)

	result_path = Path(f"../result/{inst_}")

	instance_ = f"{method_}_{form_}_{inst_}.txt"
  
	if form_ == "fmaxc1":
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
	elif form_ == "fmaxmicutsetc3":
	    fmaxcutmiset_c3.tukey_fmax_cut_miset_c3(method_,instance_,G,result_path)
	elif form_ == "fmaxmicutbsetc3":
		fmaxcutbmiset_c3.tukey_fmax_cutb_miset_c3(method_,instance_,G,result_path)
	else:
		print("parameters errado!")

	G.clear()
