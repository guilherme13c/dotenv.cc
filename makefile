CC := clang++
CFLAGS := -std=c++17 -O3 -Wall

INC_DIR := inc
SRC_DIR := src
BIN_DIR := bin
INSTALL_DIR := /usr/local

INC := $(INC_DIR)/config.h $(INC_DIR)/utils.h
SRC := $(SRC_DIR)/config.cc $(SRC_DIR)/utils.cc
LIB := $(BIN_DIR)/libdotenv.a

build: $(LIB)

$(LIB): $(SRC)
	$(CC) -c $(SRC) $(CFLAGS) -I$(INC_DIR)
	ar rcs $(LIB) *.o
	rm -f *.o

install: $(LIB)
	cp $(LIB) $(INSTALL_DIR)/lib/
	cp $(INC) $(INSTALL_DIR)/include/

clean:
	rm $(LIB) -f
