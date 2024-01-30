CC := clang++
CFLAGS := -std=c++17 -O3 -Wall

INC_DIR := inc
SRC_DIR := src
BIN_DIR := bin
INSTALL_DIR := /usr/local

INC := $(INC_DIR)/config.h $(INC_DIR)/utils.h
SRC := $(SRC_DIR)/config.cc $(SRC_DIR)/utils.cc
LIB := $(BIN_DIR)/libdotenv.a
TEST := $(SRC_DIR)/main.cc

build: $(LIB) main

$(LIB): $(SRC)
	$(CC) -c $(SRC) $(CFLAGS) -I$(INC_DIR)
	ar rcs $(LIB) *.o
	rm -f *.o

main: $(TEST)
	$(CC) -o $(BIN_DIR)/main $(TEST) -I$(INC_DIR) -L$(INSTALL_DIR)/lib/ -ldotenv

install: $(LIB)
	cp $(LIB) $(INSTALL_DIR)/lib/
	cp $(INC) $(INSTALL_DIR)/include/

test: build
	./bin/main

uninstall:
	rm -f $(INSTALL_DIR)/lib/libdotenv.a
	rm -rf $(INSTALL_DIR)/include/dotenv

clean:
	rm $(LIB) -f
	rm $(BIN_DIR)/main -f
