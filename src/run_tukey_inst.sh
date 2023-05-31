#!/bin/bash

inst_=karate
method_=mip

mkdir -p ../result/${inst_}
mkdir -p ../report/${inst_}

for form_ in neighb #fmin fmax miset neighb
do
	python3 main_tukey_inst.py \
	../instances/${inst_}/${inst_}.gml.gz \
	${inst_} ${method_} ${form_} \
	>> ../report/${inst_}/out_${method_}_${form_}_${inst_}.txt
done
