#!/bin/zsh

gem5 ./build/gem/gem-gcc-O0.py
cp ./data/gem5/out.csv ./data/gem5/gem-gcc-O0.csv
echo gcc-O0 done!

gem5 ./build/gem/gem-gcc-O1.py
cp ./data/gem5/out.csv ./data/gem5/gem-gcc-O1.csv
echo gcc-O1 done!
