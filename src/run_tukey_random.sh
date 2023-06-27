#!/bin/bash

inst_=internet_graph
method_=mip
dim_=200

mkdir -p ../result/${inst_}
mkdir -p /home/jossian/Downloads/desenv/report/tukey/${inst_}

# fminc0 fminc0noclq fminc1noclq fminc1
# fminc2 fminmiset fminmisetc2 fminmisetc3 fmincutmisetc3 fmincutbmisetc3  

# fmaxc0 fmaxc0noclq fmaxc1noclq fmaxc1
# fmaxc2 fmaxmiset fmaxmisetc2 fmaxmisetc3  

for form_ in fminc2 fminmiset fminmisetc2 fminmisetc3 fmincutmisetc3 fmincutbmisetc3
do
	for id in {6..10}
	do
		python3 main_tukey_random.py \
		../instances/${inst_}/${dim_}/${inst_}_${dim_}_${id}.gml.gz \
		${method_} ${form_} ${inst_} ${dim_} ${id} \
		>> /home/jossian/Downloads/desenv/report/tukey/${inst_}/${method_}_${form_}_${inst_}_${dim_}_${id}.txt
   	done
done
