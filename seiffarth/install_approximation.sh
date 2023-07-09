#!/bin/bash
##mkdir Approximation/build 
cd Approximation/build || exit
cmake .. && make && cd .. && cd ..
##mkdir out
