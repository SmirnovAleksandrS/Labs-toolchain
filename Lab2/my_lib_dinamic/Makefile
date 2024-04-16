CC = gcc
CFLAGS = -Wall -Wextra -std=c99 -fPIC
LDFLAGS = -L. -Wl,-rpath,. -lmath_functions

SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin

SRCS = $(wildcard $(SRC_DIR)/*.c)
OBJS = $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRCS))
BIN = $(BIN_DIR)/main
LIB = libmath_functions.so

all: $(BIN)

$(BIN): $(OBJS) | $(BIN_DIR) $(LIB)
	$(CC) $(OBJS) $(LDFLAGS) -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR) $(BIN_DIR):
	mkdir -p $@

$(LIB): $(OBJS)
	$(CC) -shared -o $@ $(OBJS)

clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR) $(LIB)

.PHONY: all clean
