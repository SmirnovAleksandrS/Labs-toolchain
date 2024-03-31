CC = /opt/sc-dt/riscv-gcc/bin/riscv64-unknown-linux-gnu-gcc
QEMU_USER ?= /opt/sc-dt/tools/bin/qemu-riscv63
CFLAGS ?= -O0
CONTAINER ?= rv_sim_bench
BIN := example

.PHONY: clean

clean:
	rm *.o ${BIN} fact

bin: main.c fact.c
	${CC} ${CFLAGS} $^ -o fact

main: main.c
	${CC} ${CFLAGS} $^ -c -o $@.o

fact: fact.c
	${CC} ${CFLAGS} $^ -c -o $@.o

example: main.c
	${CC} ${CFLAGS} $^ -o ${BIN}

comp-obj-docker: main.c
	MY_PATH ?= pwd
	sudo docker exec -it ${CONTAINER} ${CC} ${CFLAGS} ${MY_PATH}/$^ -c -o $^.o