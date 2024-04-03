#!/bin/zsh


make build-gem CC=/opt/sc-dt/riscv-gcc/bin/riscv64-unknown-linux-gnu-gcc CFLAGS=-O0 NAME=gem/gem_gcc-O0
make build-gem CC=/opt/sc-dt/riscv-gcc/bin/riscv64-unknown-linux-gnu-gcc CFLAGS=-O1 NAME=gem/gem_gcc-O1
make build-gem CC=/opt/sc-dt/riscv-gcc/bin/riscv64-unknown-linux-gnu-gcc CFLAGS=-O2 NAME=gem/gem_gcc-O2
make build-gem CC=/opt/sc-dt/riscv-gcc/bin/riscv64-unknown-linux-gnu-gcc CFLAGS=-O3 NAME=gem/gem_gcc-O3
# make build CC=/opt/sc-dt/riscv-gcc/bin/riscv64-unknown-linux-gnu-gcc CFLAGS=-O3 NAME=gcc-O3

make build-gem CC=/opt/sc-dt/llvm/bin/clang CFLAGS=-O0 NAME=gem/gem_llvm-O0
make build-gem CC=/opt/sc-dt/llvm/bin/clang CFLAGS=-O1 NAME=gem/gem_llvm-O1
make build-gem CC=/opt/sc-dt/llvm/bin/clang CFLAGS=-O2 NAME=gem/gem_llvm-O2
make build-gem CC=/opt/sc-dt/llvm/bin/clang CFLAGS=-O3 NAME=gem/gem_llvm-O3

