#ifndef MINARET_H
#define MINARET_H

#include <inttypes.h>
#define IO_REG32 (volatile uint32_t*)

// mmio register map
#define MINA_HDMI_PAL  ((uint32_t*) 0x80000000)
#define MINA_HDMI_PIX  ((uint8_t*)  0x80000400)
#define MINA_UART      (*(IO_REG32 0xffffff00))
#define MINA_KEYS      (*(IO_REG32 0xffffff10))
#define MINA_TIMER     (*(IO_REG32 0xffffff20))

void mina_uart_putc(char c);
char mina_uart_getc(void);
void mina_uart_puts(const char *s);
void mina_uart_gets(char *s, int n);
void mina_time_wait(uint32_t ms);

#endif //MINARET_H
