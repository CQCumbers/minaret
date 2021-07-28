#include <stdio.h>
#include <sys/stat.h>
#include <string.h>
#include "minaret.h"

// minaret BSP

void mina_uart_putc(char c) {
  MINA_UART = (uint32_t)c;
}

char mina_uart_getc(void) {
  // wait for valid read
  uint32_t data = 0;
  while (~(data = MINA_UART) & 0x8000);
  return (char)data;
}

void mina_uart_puts(const char *s) {
  // append newline to string
  while (*s) mina_uart_putc(*s++);
  mina_uart_putc('\n');
}

void mina_uart_gets(char *s, int n) {
  // replace newline with null
  for (int i = 0; i + 1 < n; ++i) {
    char c = mina_uart_getc();
    if (!c || c == '\n') break;
    s[i + 0] = c, s[i + 1] = 0;
  }
}

void mina_time_wait(uint32_t ms) {
  // wait for timer ticks
  uint32_t done = MINA_TIMER + ms;
  while (MINA_TIMER < done);
}

// newlib stubs

void *_sbrk(int incr) {
  extern int _end;
  static unsigned char *heap;
  unsigned char *prev_heap;

  heap = heap ? heap : (unsigned char *)&_end;
  prev_heap = heap, heap += incr;

  return prev_heap;
}

int _close(int file) {
  return -1;
}

int _fstat(int file, struct stat *st) {
  st->st_mode = S_IFCHR;

  return 0;
}

int _isatty(int file) {
  return 1;
}

int _lseek(int file, int ptr, int dir) {
  return 0;
}

void _exit(int status) {
  while (1);
}

void _kill(int pid, int sig) {
  return;
}

int _getpid(void) {
  return -1;
}

int _open(const char *name, int flags, int mode) {
  return -1;
}

int _write(int file, char *ptr, int len) {
  int written = 0;

  if ((file != 1) && (file != 2)) {
    return -1;
  }

  for (; len != 0; --len) {
    mina_uart_putc(*ptr++);
    ++written;
  }
  return written;
}

int _read(int file, char *ptr, int len) {
  int read = 0;

  if (file != 0) {
    return -1;
  }

  for (; len > 0; --len) {
    *ptr++ = mina_uart_getc();
    ++read;
  }
  return read;
}

int _link(char *old, char *new) {
  return -1;
}

int _unlink(char *name) {
  return -1;
}

int mkdir(const char *path, mode_t mode) {
  return -1;
}
