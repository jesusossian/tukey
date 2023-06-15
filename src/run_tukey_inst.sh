#!/bin/bash

inst_=karate
method_=mip

mkdir -p ../result/${inst_}
mkdir -p ../report/${inst_}

#for form_ in fmaxc2 fmaxmiset fmaxmisetc2 fmaxmisetc3
for form_ in fminc2 fminmiset fminmisetc2 fminmisetc3
do
	python3 main_tukey_inst.py \
	../instances/${inst_}/${inst_}.gml.gz \
	${method_} ${form_} ${inst_} \
	>> ../report/${inst_}/out_${method_}_${form_}_${inst_}.txt
done
