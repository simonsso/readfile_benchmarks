CC		:= clang++
C_FLAGS := -Wall -Wextra -O3
C11_FLAGS := -std=c++17 -Wall -Wextra -O3
C17_FLAGS := -std=c++11 -Wall -Wextra -O3

BIN		:= bin
SRC		:= src
INCLUDE	:= include
LIB		:= lib

LIBRARIES	:= 

ifeq ($(OS),Windows_NT)
EXECUTABLE	:= main.exe
else
EXECUTABLE	:= main
endif

all: $(BIN)/$(EXECUTABLE)_c11 $(BIN)/$(EXECUTABLE)_c17 $(BIN)/$(EXECUTABLE)_gcc $(BIN)/$(EXECUTABLE)_c

clean:
	$(RM) $(BIN)/$(EXECUTABLE)_*

run: $(BIN)/$(EXECUTABLE)_*
	time echo $^ 

$(BIN)/$(EXECUTABLE)_c11: $(SRC)/*.cpp
	$(CC) $(C11_FLAGS) $(D_FLAGS) -I$(INCLUDE) -L$(LIB) $^ -o $@ $(LIBRARIES)

$(BIN)/$(EXECUTABLE)_c17: $(SRC)/*.cpp
	$(CC) $(C17_FLAGS) $(D_FLAGS) -I$(INCLUDE) -L$(LIB) $^ -o $@ $(LIBRARIES)

$(BIN)/$(EXECUTABLE)_gcc: $(SRC)/*.cpp
	g++ $(C_FLAGS) -std=c++11  $(D_FLAGS) -I$(INCLUDE) -L$(LIB) $^ -o $@ $(LIBRARIES)

$(BIN)/$(EXECUTABLE)_c: $(SRC)/*.c
	gcc $(C_FLAGS)  -I$(INCLUDE) -L$(LIB) $^ -o $@ $(LIBRARIES)
