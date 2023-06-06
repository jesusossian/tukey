#!/bin/bash

inst_=internet_graph
method_=mip
dim_=200

mkdir -p ../result/${inst_}
mkdir -p ../report/${inst_}

for form_ in fmax fmaxmiset #fmin fminmiset fminmisetn0 fminmisetn1 fmax fmaxmiset 
do
	for id in {1..3}
	do
		python3 main_tukey_random.py \
		../instances/${inst_}/${dim_}/${inst_}_${dim_}_${id}.gml.gz \
		${method_} ${form_} ${inst_} ${dim_} ${id} \
		>> ../report/${inst_}/${method_}_${form_}_${inst_}_${dim_}_${id}.txt
   	done
done
