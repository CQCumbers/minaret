TOOLCHAIN := /Users/alexanderzhang/Documents/llvm-project/build/bin
SYSROOT := /Users/alexanderzhang/Documents/mina32-newlib/examples/sysroot
COMMON  := /Users/alexanderzhang/Documents/mina32-newlib/examples/common

CC := $(TOOLCHAIN)/clang
OBJCOPY := $(TOOLCHAIN)/llvm-objcopy

CFLAGS := -target mina32-elf -g -Os
CFLAGS += --sysroot=$(SYSROOT)
LDFLAGS := -Wl,-T$(COMMON)/minaret.ld

.PHONY: all clean

target boot: LDFLAGS += -Wl,--defsym=make_boot=1

all: boot.mif crt0.o

boot.mif: boot.bin
	./bin2mif -d 1024 -w 32 -f 0 -i $^ -o $@

boot.bin: boot
	$(OBJCOPY) -O binary $^ $@

boot: boot.c
	$(CC) $(CFLAGS) $(LDFLAGS) $^ -o $@

crt0.o: crt0.s
	$(CC) -c $(CFLAGS) $^ -o $@

clean:
	rm boot.mif boot.bin boot crt0.o
