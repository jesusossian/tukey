#!/bin/bash
##mkdir Evaluation/build
cd Evaluation/build || exit
cmake .. && make && cd .. && cd ..
##mkdir out
