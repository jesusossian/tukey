#!/bin/bash
##mkdir TukeyDepth/build
cd TukeyDepth/build || exit
cmake .. && make && cd .. && cd ..
##mkdir out
