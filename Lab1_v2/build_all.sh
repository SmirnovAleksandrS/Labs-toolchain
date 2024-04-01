#!/bin/zsh


make build CC=/opt/sc-dt/riscv-gcc/bin/riscv64-unknown-linux-gnu-gcc CFLAGS=-O0 NAME=gcc-O0
make build CC=/opt/sc-dt/riscv-gcc/bin/riscv64-unknown-linux-gnu-gcc CFLAGS=-O1 NAME=gcc-O1
make build CC=/opt/sc-dt/riscv-gcc/bin/riscv64-unknown-linux-gnu-gcc CFLAGS=-O2 NAME=gcc-O2
make build CC=/opt/sc-dt/riscv-gcc/bin/riscv64-unknown-linux-gnu-gcc CFLAGS=-O3 NAME=gcc-O3
# make build CC=/opt/sc-dt/riscv-gcc/bin/riscv64-unknown-linux-gnu-gcc CFLAGS=-O3 NAME=gcc-O3

make build CC=/opt/sc-dt/llvm/bin/clang CFLAGS=-O0 NAME=llvm-O0
make build CC=/opt/sc-dt/llvm/bin/clang CFLAGS=-O1 NAME=llvm-O1
make build CC=/opt/sc-dt/llvm/bin/clang CFLAGS=-O2 NAME=llvm-O2
make build CC=/opt/sc-dt/llvm/bin/clang CFLAGS=-O3 NAME=llvm-O3