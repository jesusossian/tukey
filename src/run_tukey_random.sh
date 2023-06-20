#!/bin/bash

inst_=internet_graph
method_=mip
dim_=200

mkdir -p ../result/${inst_}
mkdir -p ../report/${inst_}

# fminc0 fminc0noclq fminc1noclq fminc1 fminc2 fminmiset fminmisetc2 fminmisetc3  
# fmaxc0 fmaxc0noclq fmaxc1noclq fmaxc1 fmaxc2 fmaxmiset fmaxmisetc2 fmaxmisetc3  

for form_ in fmincutmisetc3
do
	for id in {1..1}
	do
		python3 main_tukey_random.py \
		../instances/${inst_}/${dim_}/${inst_}_${dim_}_${id}.gml.gz \
		${method_} ${form_} ${inst_} ${dim_} ${id} \
		>> ../report/${inst_}/${method_}_${form_}_${inst_}_${dim_}_${id}.txt
   	done
done
