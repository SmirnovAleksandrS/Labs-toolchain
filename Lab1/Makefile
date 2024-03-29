CC = /opt/sc-dt/riscv-gcc/bin/riscv64-unknown-linux-gnu-gcc
CCLLVM = /opt/sc-dt/llvm/bin/clang
QEMU_USER ?= /opt/sc-dt/tools/bin/qemu-riscv64
CFLAGS ?= -O3 -static

BUILD_DIR := build
.DEFAULT_GOAL := hello

.PHONY: _build_dir sort clean

_build_dir:
	@mkdir -p ${BUILD_DIR}

hello: sort.c _build_dir
	${CC} ${CFLAGS} sort.c -o ${BUILD_DIR}/sort.elf

build: hello

build-llvm:
	${CCLLVM} ${CFLAGS} sort.c -o ${BUILD_DIR}/sort.elf

show: sort
	file ${BUILD_DIR}/sort.elf

run: sort
	${BUILD_DIR}/sort.elf

run-qemu: sort
	${QEMU_USER} ${BUILD_DIR}/sort.elf

clean:
	rm -r ${BUILD_DIR}
