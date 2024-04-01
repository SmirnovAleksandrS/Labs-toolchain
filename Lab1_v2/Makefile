CC ?= gcc
# CCLLVM = /opt/sc-dt/llvm/bin/clang
QEMU_USER ?= /opt/sc-dt/tools/bin/qemu-riscv64
CFLAGS ?= -O3
CFLAGS_CONST = -static
CONTAINER ?= rv_sim_bench
NAME ?= name

BUILD_DIR := build
ASM_DIR := asm
DATA_DIR := data
.DEFAULT_GOAL := hello

.PHONY: _build_dir sort clean

_build_dir:
	@mkdir -p ${BUILD_DIR}

# _build_dir_asm:
# 	@mkdir -p ${ASM_DIR}

hello: sort
	sudo docker exec -it ${CONTAINER} ${CC} ${CFLAGS} ${CFLAGS_CONST} ${PWD}/$^.c -o ${PWD}/${BUILD_DIR}/${NAME}.elf

build: hello

# build-llvm: sort
# 	sudo docker exec -it ${CONTAINER} ${CCLLVM} ${CFLAGS} ${PWD}/$^.c -o ${PWD}/${BUILD_DIR}/$^.elf

show: sort
	file ${BUILD_DIR}/sort.elf

run: sort
	${BUILD_DIR}/sort.elf

run-qemu: sort
	sudo docker exec -it ${CONTAINER} ${QEMU_USER} ${PWD}/${BUILD_DIR}/${NAME}.elf

clean:
	rm -r ${BUILD_DIR}

docker-asm: sort
	sudo docker exec -it ${CONTAINER} ${CC} ${CFLAGS} ${PWD}/$^.c -S -o ${PWD}/${ASM_DIR}/$^.asm

# docker-asm-llvm: sort
# 	sudo docker exec -it ${CONTAINER} ${CCLLVM} ${CFLAGS} ${PWD}/$^.c -S -o ${PWD}/${ASM_DIR}/$^.asm