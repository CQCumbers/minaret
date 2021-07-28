CC := gcc
CFLAGS := -Wall -std=c11 -g -O3 -I/usr/local/Cellar -lsdl2

.PHONY: clean

simulator: simulator.c debug.c debug.h elf.h
	$(CC) $(CFLAGS) simulator.c debug.c -o $@

clean:
	rm simulator
	rm -rf simulator.dSYM
