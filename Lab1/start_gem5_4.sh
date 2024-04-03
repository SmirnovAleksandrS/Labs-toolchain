#!/bin/zsh

gem5 ./build/gem/gem-llvm-O2.py
cp ./data/gem5/out.csv ./data/gem5/gem-llvm-O2.csv
echo llvm-O2 done!

gem5 ./build/gem/gem-llvm-O3.py
cp ./data/gem5/out.csv ./data/gem5/gem-llvm-O3.csv
echo llvm-O3 done!
