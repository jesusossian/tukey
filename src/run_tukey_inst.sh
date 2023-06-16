#!/bin/bash

inst_=karate
method_=mip

mkdir -p ../result/${inst_}
mkdir -p ../report/${inst_}

# fmaxc1 fmaxc2 fmaxmiset fmaxmisetc2 fmaxmisetc3
# fminc1 fminc2 fminmiset fminmisetc2 fminmisetc3 
for form_ in fmaxc1 fmaxc2 fmaxmiset fmaxmisetc2 fmaxmisetc3
do
	python3 main_tukey_inst.py \
	../instances/${inst_}/${inst_}.gml.gz \
	${method_} ${form_} ${inst_} \
	>> ../report/${inst_}/out_${method_}_${form_}_${inst_}.txt
done
