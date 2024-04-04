#!/bin/bash

gem5 ./build/gem/gem-llvm-O0.py
cp ./data/gem5/out.csv ./data/gem5/gem-llvm-O0.csv
echo llvm-O0 done!

gem5 ./build/gem/gem-llvm-O1.py
cp ./data/gem5/out.csv ./data/gem5/gem-llvm-O1.csv
echo llvm-O1 done!
