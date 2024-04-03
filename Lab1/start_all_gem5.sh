#!/bin/zsh

gem5 ./build/gem/gem-gcc-O0.py
cp ./data/gem5/out.csv ./data/gem5/gem-gcc-O0.csv
echo gcc-O0 done!

gem5 ./build/gem/gem-gcc-O0.py
cp ./data/gem5/out.csv ./data/gem5/gem-gcc-O0.csv
echo gcc-O1 done!

gem5 ./build/gem/gem-gcc-O0.py
cp ./data/gem5/out.csv ./data/gem5/gem-gcc-O0.csv
echo gcc-O2 done!

gem5 ./build/gem/gem-gcc-O0.py
cp ./data/gem5/out.csv ./data/gem5/gem-gcc-O0.csv
echo gcc-O3 done!

gem5 ./build/gem/gem-gcc-O0.py
cp ./data/gem5/out.csv ./data/gem5/gem-gcc-O0.csv
echo llvm-O0 done!

gem5 ./build/gem/gem-gcc-O0.py
cp ./data/gem5/out.csv ./data/gem5/gem-gcc-O0.csv
echo llvm-O1 done!

gem5 ./build/gem/gem-gcc-O0.py
cp ./data/gem5/out.csv ./data/gem5/gem-gcc-O0.csv
echo llvm-O2 done!

gem5 ./build/gem/gem-gcc-O0.py
echo llvm-O3 done!
echo All done!