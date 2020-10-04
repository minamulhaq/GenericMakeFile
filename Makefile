CC = g++
ifeq ($(CC), gcc)
EXT = .c
else
EXT = .cpp
endif


RM = rm -rf
MD = mkdir -p 
BIN = bin/
OBJ = obj/
INC = inc/
SRC = src/
LIB = lib/

SRCS = $(wildcard $(SRC)*$(EXT))
OBJS = $(patsubst $(SRC)%$(EXT),$(OBJ)%.o, $(SRCS))
LIBS = $(wildcard $(lib)*.a)

all: run 	

run: bin
	bin/bin

bin: $(OBJS) | $(BIN)
	$(CC) $(OBJS) $(LIBS)  -o $(BIN)bin

$(OBJ)%.o: $(SRC)%$(EXT) | $(OBJ)
	$(CC) -c $< -o $@ -I$(INC)

$(OBJ) $(BIN): 
	$(MD) $@

.PHONY: all clean run
clean:
	$(RM) obj bin *.o
