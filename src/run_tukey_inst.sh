#!/bin/bash

inst_=karate
method_=lp

mkdir -p ../result/${inst_}
mkdir -p ../report/${inst_}

for form_ in fmin fmax miset neighb
do
	python3 main_tukey_inst.py \
	../instances/${inst_}/${inst_}.gml.gz \
	${method_} ${form_} ${inst_}\
	>> ../report/${inst_}/out_${method_}_${form_}_${inst_}.txt
done