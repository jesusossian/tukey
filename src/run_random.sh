#!/bin/bash

inst_=internet_graph
method_=mip
dir_=internet_graph
dim_=200

#mkdir -p ../result/${dir_}
mkdir -p ../report/${dir_}

for form_ in miset
do
	for id in {1..10}
	do
		python3 tukey_random.py \
		../instances/${inst_}/${dim_}/${inst_}_${dim_}_${id}.gml.gz \
		${inst_} ${method_} ${form_} ${dim_} ${id} \
		>> ../report/${dir_}/${inst_}_${form_}_${dim_}_${id}.txt
   	done
done
