#!/bin/zsh

gem5 ./build/gem/gem-gcc-O2.py
cp ./data/gem5/out.csv ./data/gem5/gem-gcc-O2.csv
echo gcc-O2 done!

gem5 ./build/gem/gem-gcc-O3.py
cp ./data/gem5/out.csv ./data/gem5/gem-gcc-O3.csv
echo gcc-O3 done!
