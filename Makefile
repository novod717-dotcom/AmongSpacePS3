# Build para computador (teste local com SDL2)
CC ?= cc
CFLAGS ?= -O2 -Wall -Wextra -std=c11
SDL_CFLAGS := $(shell sdl2-config --cflags 2>/dev/null)
SDL_LIBS := $(shell sdl2-config --libs 2>/dev/null)
TARGET = among-space
SRC = src/main.c

all: $(TARGET)

$(TARGET): $(SRC)
	@test -n "$(SDL_LIBS)" || (echo "SDL2 nao encontrado. Instale SDL2 e sdl2-config."; exit 1)
	$(CC) $(CFLAGS) $(SDL_CFLAGS) -o $@ $^ $(SDL_LIBS) -lm

clean:
	rm -f $(TARGET) *.o

.PHONY: all clean
