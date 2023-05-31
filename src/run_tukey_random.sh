#!/bin/bash

inst_=internet_graph
method_=mip
dim_=50

#mkdir -p ../result/${dir_}
mkdir -p ../report/${dir_}

for form_ in fmin fmax miset neighb
do
	for id in {5..5}
	do
		python3 main_tukey_random.py \
		../instances/${inst_}/${dim_}/${inst_}_${dim_}_${id}.gml.gz \
		${inst_} ${method_} ${form_} ${dim_} ${id} \
		>> ../report/${inst_}/${inst_}_${method_}_${form_}_${dim_}_${id}.txt
   	done
done
