#!/bin/bash
#Т.к. в докер параметры команды нормально не передаются, надо запускать из непосредственно из контейнера

/opt/sc-dt/tools/bin/qemu-riscv64 ./build/gcc-O0.elf ./data/gcc-O0.csv
echo gcc-O0 done!
/opt/sc-dt/tools/bin/qemu-riscv64 ./build/gcc-O1.elf ./data/gcc-O1.csv
echo gcc-O1 done!
/opt/sc-dt/tools/bin/qemu-riscv64 ./build/gcc-O2.elf ./data/gcc-O2.csv
echo gcc-O2 done!
/opt/sc-dt/tools/bin/qemu-riscv64 ./build/gcc-O3.elf ./data/gcc-O3.csv
echo gcc-O3 done!
/opt/sc-dt/tools/bin/qemu-riscv64 ./build/llvm-O0.elf ./data/llvm-O0.csv
echo llvm-O0 done!
/opt/sc-dt/tools/bin/qemu-riscv64 ./build/llvm-O1.elf ./data/llvm-O1.csv
echo llvm-O1 done!
/opt/sc-dt/tools/bin/qemu-riscv64 ./build/llvm-O2.elf ./data/llvm-O2.csv
echo llvm-O2 done!
/opt/sc-dt/tools/bin/qemu-riscv64 ./build/llvm-O3.elf ./data/llvm-O3.csv
echo llvm-O3 done!
echo All done!