#ifndef DEBUG_H
#define DEBUG_H

typedef enum {
  WATCH_NONE = 0,
  WATCH_WRITE = 1,
  WATCH_READ = 2,
  WATCH_ACCESS = 3
} watch_t;

typedef struct {
  void *ctx;
  unsigned (*read_mem)(unsigned addr);
  void (*write_mem)(unsigned addr, unsigned val);
  unsigned (*read_reg)(void *ctx, unsigned idx);
  void (*write_reg)(void *ctx, unsigned idx, unsigned val);
  void (*set_break)(unsigned addr);
  void (*clr_break)(unsigned addr);
  void (*set_watch)(unsigned addr, unsigned len, char type);
  void (*clr_watch)(unsigned addr, unsigned len, char type);
} debug_t;

void debug_init(unsigned port, debug_t conf);
unsigned debug_poll(void);
unsigned debug_update(unsigned step);

#endif
