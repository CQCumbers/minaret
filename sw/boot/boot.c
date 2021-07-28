#include <stdlib.h>
#include <inttypes.h>

// minaret BSP

#define IO_REG32 (volatile uint32_t*)
#define MINA_UART (*(IO_REG32 0xffffff00))

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

void _exit(int status) {
  while (1);
}

// bootloader functions

#define MAX_ADDRESS 0x04000000
#define LINE_LENGTH 256

static unsigned hex2int(const char *s, int n) {
  // convert ascii hex digits to int
  unsigned data = 0, c = 0;
  while (n-- && (c = *s++)) {
    if (c >= '0' && c <= '9') c -= '0';
    else if (c >= 'A' && c <= 'F') c -= '7';
    else if (c >= 'a' && c <= 'f') c -= 'W';
    data = (data << 4) | (c & 0xf);
  }
  return data;
}

static void fail(const char *line, const char *msg) {
  // print message and exit
  mina_uart_puts(line);
  mina_uart_puts(msg);
  _exit(EXIT_FAILURE);
}

int main(void) {
  // print help message
  mina_uart_puts("MINA32 UART Bootloader v0.1");
  mina_uart_puts("Paste intel hex file below:");
  uint32_t segment = 0, start = 0;

  while (1) {
    // read ihex record
    char line[LINE_LENGTH];
    mina_uart_gets(line, LINE_LENGTH);
    if (line[0] != ':') fail(line, "No start code");

    // verify checksum
    uint8_t checksum = 0;
    for (int i = 1; line[i] && line[i+1]; i += 2)
      checksum += hex2int(line + i, 2);
    if (checksum != 0) fail(line, "Checksum fail");

    // parse record fields
    uint8_t count = hex2int(line + 1, 2);
    uint32_t address = hex2int(line + 3, 4);
    uint8_t record_type = hex2int(line + 7, 2); 

    if (record_type == 0x00) {
      // verify address
      address = segment + address;
      if (address + count >= MAX_ADDRESS)
        fail(line, "Record address out of bounds");

      // handle data record
      for (int i = 0; i < count; i++) {
        uint8_t byte = hex2int(line + 9 + i * 2, 2);
        *(uint8_t*)(address + i) = byte;
      }
    } else if (record_type == 0x01) {
      // handle end of file record
      mina_uart_puts("App loaded");
      ((void(*)(void))start)();
    } else if (record_type == 0x02) {
      // handle extended segment address
      if (count != 2) fail(line, "Invalid count");
      segment = hex2int(line + 9, 4) << 4;
    } else if (record_type == 0x03) {
      // handle start segment address
      if (count != 4) fail(line, "Invalid count");
      start = hex2int(line + 9, 8);
    } else {
      // ignore other record types
      mina_uart_puts(line);
      mina_uart_puts("Ignored record type");
    }
  }
}
