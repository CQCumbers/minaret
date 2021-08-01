#include "debug.h"
#include "elf.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <SDL2/SDL.h>

#define MEM_SIZE   0x04000000
#define HDMI_SIZE  0x00020000
static unsigned char mem[MEM_SIZE + HDMI_SIZE];

typedef struct {
  unsigned regs[16];
  unsigned bank[8];
  unsigned pc;
  unsigned fret;
  unsigned omcr;

  union {
    unsigned val;
    struct {
      unsigned comment:8;
      unsigned cause:4;
      unsigned:4;
      unsigned mode:2;
      unsigned t:1;
      unsigned id:1;
      unsigned:12;
    };
  } mcr;
} mina_t;

/* === Debugger Functions === */

typedef struct break_t break_t;

struct break_t {
  unsigned addr;
  unsigned inst;
  break_t *next;
};

static char watches[MEM_SIZE];
static break_t *breaks;
static unsigned step;

static unsigned read32(unsigned addr);
static void write32(unsigned addr, unsigned val);

static unsigned read_reg(void *ctx, unsigned idx) {
  mina_t *cpu = (mina_t*)ctx;
  if (idx <= 15) return cpu->regs[idx];
  if (idx == 16) return cpu->mcr.val;
  if (idx == 17) return cpu->fret;
  if (idx == 18) return cpu->pc;
  return -1;
}

static void write_reg(void *ctx, unsigned idx, unsigned val) {
  mina_t *cpu = (mina_t*)ctx;
  if (idx <= 15) cpu->regs[idx] = val;
  if (idx == 16) cpu->mcr.val = val;
  if (idx == 17) cpu->fret = val;
  if (idx == 18) cpu->pc = val;
}

static void set_break(unsigned addr) {
  break_t *tmp = breaks;
  breaks = malloc(sizeof(break_t));
  breaks->addr = addr;
  breaks->next = tmp;
}

static void clr_break(unsigned addr) {
  break_t **ptr = &breaks, *tmp = *ptr;
  while (tmp && tmp->addr != addr)
    ptr = &tmp->next, tmp = *ptr;

  if (tmp == NULL) return;
  *ptr = tmp->next, free(tmp);
}

static void check_watch(unsigned idx, unsigned len, char type) {
  if (idx >= MEM_SIZE) return;
  for (unsigned i = idx; i < idx + len; ++i)
    if (watches[i] & type) step = ~i;
}

static void set_watch(unsigned addr, unsigned len, char type) {
  unsigned idx = addr & (MEM_SIZE - 1);
  for (unsigned i = 0; i < len; ++i)
    watches[idx + i] |= type;
}

static void clr_watch(unsigned addr, unsigned len, char type) {
  unsigned idx = addr & (MEM_SIZE - 1);
  for (unsigned i = 0; i < len; ++i)
    watches[idx + i] &= ~type;
}

static void handle_step(void) {
  for (break_t *i = breaks; i; i = i->next)
    write32(i->addr, i->inst);
  step = debug_update(step);

  for (break_t *i = breaks; i; i = i->next) {
    i->inst = read32(i->addr);
    write32(i->addr, 0x70000000);
  }
}

/* === Memory Mapped IO === */

static long cycles;
static SDL_Window *window;
static SDL_Renderer *renderer;
static SDL_Texture *texture;

static unsigned key_queue[16];
static unsigned key_read;
static unsigned key_write;

static unsigned key_code(SDL_Event e) {
  // based on doomgeneric
  unsigned key = e.key.keysym.sym;
  switch (key) {
  default: return key & 0xff;
  case SDLK_RETURN: return 0x0d;
  case SDLK_ESCAPE: return 0x1b;
  case SDLK_SPACE:  return 0xa2;
  case SDLK_LCTRL:  return 0xa3;
  case SDLK_RCTRL:  return 0xa3;
  case SDLK_LSHIFT: return 0xb6;
  case SDLK_RSHIFT: return 0xb6;
  case SDLK_LEFT:   return 0xac;
  case SDLK_UP:     return 0xad;
  case SDLK_RIGHT:  return 0xae;
  case SDLK_DOWN:   return 0xaf;
  }
}

static void hdmi_update(void) {
  // copy frame to screen
  void *pixels; int pitch;
  SDL_LockTexture(texture, NULL, &pixels, &pitch);

  unsigned char *hdmi = mem + MEM_SIZE;
  for (int i = 0; i < 320 * 240; ++i) {
    unsigned color = hdmi[1024 + i] * 4;
    memcpy(pixels + i * 4, hdmi + color, 4);
  }

  // present updated screen
  SDL_UnlockTexture(texture);
  SDL_RenderCopy(renderer, texture, NULL, NULL);
  SDL_RenderPresent(renderer);

  // handle keyboard inputs
  for (SDL_Event e; SDL_PollEvent(&e);) {
    if (e.type == SDL_QUIT) exit(0);
    if (e.type == SDL_KEYDOWN) {
      unsigned i = key_write++ & 15;
      key_queue[i] = key_code(e);
    } else if (e.type == SDL_KEYUP) {
      unsigned i = key_write++ & 15;
      key_queue[i] = key_code(e) | 0x100;
    }
  }
}

static unsigned get_keys(void) {
  if (key_read == key_write) return 0;
  unsigned i = key_read++ & 15;
  return 0x8000 | key_queue[i];
}

/* === Memory Access === */

static unsigned mmio_read(unsigned idx) {
  switch (idx & 0xf0) {
  case 0x00: return 0x8000 | getchar();
  case 0x10: return get_keys();
  case 0x20: return cycles >> 16;
  default: return 0;
  }
}

static void mmio_write(unsigned idx, unsigned val) {
  if (idx & 0xf0) return;
  putchar(val & 0xff);
}

static unsigned read32(unsigned addr) {
  unsigned val, idx = addr & (MEM_SIZE - 4);
  if (addr >= ~0xff) return mmio_read(idx);
  if ((int)addr < 0) idx = MEM_SIZE + idx % HDMI_SIZE;
  check_watch(idx, 4, WATCH_READ);
  return memcpy(&val, mem + idx, 4), val;
}

static unsigned read16(unsigned addr) {
  unsigned val, idx = addr & (MEM_SIZE - 2);
  if (addr >= ~0xff) return mmio_read(idx) & 0xffff;
  if ((int)addr < 0) idx = MEM_SIZE + idx % HDMI_SIZE;
  check_watch(idx, 2, WATCH_READ);
  return memcpy(&val, mem + idx, 2), val;
}

static unsigned read8(unsigned addr) {
  unsigned val, idx = addr & (MEM_SIZE - 1);
  if (addr >= ~0xff) return mmio_read(idx) & 0xff;
  if ((int)addr < 0) idx = MEM_SIZE + idx % HDMI_SIZE;
  check_watch(idx, 1, WATCH_READ);
  return memcpy(&val, mem + idx, 1), val;
}

static void write32(unsigned addr, unsigned val) {
  unsigned idx = addr & (MEM_SIZE - 4);
  if (addr >= ~0xff) return mmio_write(idx, val);
  if ((int)addr < 0) idx = MEM_SIZE + idx % HDMI_SIZE;
  check_watch(idx, 4, WATCH_WRITE);
  memcpy(mem + idx, &val, 4);
}

static void write16(unsigned addr, unsigned val) {
  unsigned idx = addr & (MEM_SIZE - 2);
  if (addr >= ~0xff) return mmio_write(idx, val);
  if ((int)addr < 0) idx = MEM_SIZE + idx % HDMI_SIZE;
  check_watch(idx, 2, WATCH_WRITE);
  memcpy(mem + idx, &val, 2);
}

static void write8(unsigned addr, unsigned val) {
  unsigned idx = addr & (MEM_SIZE - 1);
  if (addr >= ~0xff) return mmio_write(idx, val);
  if ((int)addr < 0) idx = MEM_SIZE + idx % HDMI_SIZE;
  check_watch(idx, 1, WATCH_WRITE);
  memcpy(mem + idx, &val, 1);
}

/* === Simulator Interface === */

typedef union {
  unsigned val;
  struct {
    unsigned:12;
    unsigned dest:4;
    unsigned src2:4;
    unsigned src1:4;
    unsigned opcode:8;
  } s;  // STANDARD
  struct {
    unsigned imm:12;
    unsigned dest:4;
    unsigned shift:4;
    unsigned src1:4;
    unsigned opcode:8;
  } i;  // IMMEDIATE
  struct {
    unsigned immLo:12;
    unsigned dest:4;
    unsigned immHi:4;
    unsigned:4;
    unsigned opcode:8;
  } m;  // MOVE
  struct {
    unsigned:8;
    unsigned rshift:4;
    unsigned dest:4;
    unsigned src2:4;
    unsigned src1:4;
    unsigned opcode:8;
  } f;  // FUNNEL SHIFT
  struct {
    unsigned offset:24;
    unsigned opcode:8;
  } b;  // BRANCH
} inst_t;

typedef enum {
  FAULT_LOAD = 0,
  FAULT_STORE = 1,
  FAULT_STATE = 4,
  FAULT_PRIVILEGE = 5,
  FAULT_INST = 8,
  FAULT_INTERRUPT = 12,
  FAULT_SVCALL = 14,
  FAULT_RESET = 15
} fault_t;

static void execute(mina_t *cpu);

static int imms(inst_t inst, int shift) {
  int base = (inst.i.imm << 20) >> 20;
  return base << (inst.i.shift + shift);
}

static void fault(mina_t *cpu, int type) {
  cpu->fret = cpu->pc, cpu->pc = 0;
  cpu->omcr = cpu->mcr.val;
  cpu->mcr.mode = 1, cpu->mcr.id = 1;
  cpu->mcr.cause = type & 15;
  return execute(cpu);
}

static void execute(mina_t *cpu) {
  unsigned *regs, next = cpu->pc;
  while (1) {
    regs = cpu->regs, cpu->pc = next;
    if (!(cycles++ & 0xfff)) step |= debug_poll();
    if (!(cycles & 0x3ffff)) hdmi_update();
    if (step) handle_step();

    next = cpu->pc + 4;
    inst_t inst = {read32(cpu->pc)};
    switch (inst.b.opcode) {
    default: fault(cpu, FAULT_INST);

    /* === Arithmetic Instructions === */
    case 0x00: {  // ADDI
      unsigned op1 = regs[inst.i.src1];
      unsigned op2 = imms(inst, 0);
      regs[inst.i.dest] = op1 + op2;
      break;
    }
    case 0x01: {  // MULTI
      unsigned op1 = regs[inst.i.src1];
      unsigned op2 = imms(inst, 0);
      regs[inst.i.dest] = op1 * op2;
      break;
    }
    case 0x02: {  // DIVI
      unsigned op1 = regs[inst.i.src1];
      unsigned op2 = imms(inst, 0);
      unsigned res = op2 ? op1 / op2 : 0;
      regs[inst.i.dest] = res;
      break;
    }
    case 0x03: {  // REMI
      unsigned op1 = regs[inst.i.src1];
      unsigned op2 = imms(inst, 0);
      unsigned res = op2 ? op1 % op2 : 0;
      regs[inst.i.dest] = res;
      break;
    }
    case 0x04: {  // SLTI
      signed op1 = regs[inst.i.src1];
      signed op2 = imms(inst, 0);
      regs[inst.i.dest] = op1 < op2;
      break;
    }
    case 0x05: {  // SLTIU
      unsigned op1 = regs[inst.i.src1];
      unsigned op2 = imms(inst, 0);
      regs[inst.i.dest] = op1 < op2;
      break;
    }
    case 0x06: {  // NOP
      break;
    }
    case 0x07: {  // PCADDI
      unsigned op2 = imms(inst, 0);
      regs[inst.i.dest] = cpu->pc + op2;
      break;
    }
    case 0x08: {  // ADD
      unsigned op1 = regs[inst.s.src1];
      unsigned op2 = regs[inst.s.src2];
      regs[inst.s.dest] = op1 + op2;
      break;
    }
    case 0x09: {  // MULT
      unsigned op1 = regs[inst.s.src1];
      unsigned op2 = regs[inst.s.src2];
      regs[inst.s.dest] = op1 * op2;
      break;
    }
    case 0x0a: {  // DIV
      unsigned op1 = regs[inst.s.src1];
      unsigned op2 = regs[inst.s.src2];
      unsigned res = op2 ? op1 / op2 : 0;
      regs[inst.s.dest] = res;
      break;
    }
    case 0x0b: {  // REM
      unsigned op1 = regs[inst.s.src1];
      unsigned op2 = regs[inst.s.src2];
      unsigned res = op2 ? op1 % op2 : 0;
      regs[inst.s.dest] = res;
      break;
    }
    case 0x0c: {  // SLT
      signed op1 = regs[inst.s.src1];
      signed op2 = regs[inst.s.src2];
      regs[inst.s.dest] = op1 < op2;
      break;
    }
    case 0x0d: {  // SLTU
      unsigned op1 = regs[inst.s.src1];
      unsigned op2 = regs[inst.s.src2];
      regs[inst.s.dest] = op1 < op2;
      break;
    }
    case 0x0e: {  // SUB
      unsigned op1 = regs[inst.s.src1];
      unsigned op2 = regs[inst.s.src2];
      regs[inst.s.dest] = op1 - op2;
      break;
    }
    case 0x0f: {  // PCADD
      unsigned op2 = regs[inst.s.src1];
      regs[inst.s.dest] = cpu->pc + op2;
      break;
    }

    /* === Logical Instructions === */
    case 0x10: {  // ANDI
      unsigned op1 = regs[inst.i.src1];
      unsigned op2 = imms(inst, 0);
      regs[inst.i.dest] = op1 & op2;
      break;
    }
    case 0x11: {  // ORI
      unsigned op1 = regs[inst.i.src1];
      unsigned op2 = imms(inst, 0);
      regs[inst.i.dest] = op1 | op2;
      break;
    }
    case 0x12: {  // XORI
      unsigned op1 = regs[inst.i.src1];
      unsigned op2 = imms(inst, 0);
      regs[inst.i.dest] = op1 ^ op2;
      break;
    }
    case 0x13: {  // NANDI
      unsigned op1 = regs[inst.i.src1];
      unsigned op2 = imms(inst, 0);
      regs[inst.i.dest] = ~(op1 & op2);
      break;
    }
    case 0x18: {  // AND
      unsigned op1 = regs[inst.s.src1];
      unsigned op2 = regs[inst.s.src2];
      regs[inst.s.dest] = op1 & op2;
      break;
    }
    case 0x19: {  // OR
      unsigned op1 = regs[inst.s.src1];
      unsigned op2 = regs[inst.s.src2];
      regs[inst.s.dest] = op1 | op2;
      break;
    }
    case 0x1a: {  // XOR
      unsigned op1 = regs[inst.s.src1];
      unsigned op2 = regs[inst.s.src2];
      regs[inst.s.dest] = op1 ^ op2;
      break;
    }
    case 0x1b: {  // NAND
      unsigned op1 = regs[inst.s.src1];
      unsigned op2 = regs[inst.s.src2];
      regs[inst.s.dest] = ~(op1 & op2);
      break;
    }
    case 0x1c: {  // POPCNT
      unsigned op1 = regs[inst.s.src1];
      regs[inst.s.dest] = __builtin_popcount(op1);
      break;
    }
    case 0x1d: {  // CLO
      unsigned op1 = regs[inst.s.src1];
      unsigned res = ~op1 ? __builtin_clz(~op1) : 32;
      regs[inst.s.dest] = res;
      break;
    }
    case 0x1e: {  // PLO
      unsigned op1 = regs[inst.s.src1];
      unsigned res = op1 ? 32 - __builtin_clz(op1) : 32;
      regs[inst.s.dest] = res;
      break;
    }

    /* === Compare Instructions === */
    case 0x20: {  // CMPIEQ
      unsigned op1 = regs[inst.i.src1];
      unsigned op2 = imms(inst, 0);
      cpu->mcr.t = op1 == op2;
      break;
    }
    case 0x21: {  // CMPILO
      unsigned op1 = regs[inst.i.src1];
      unsigned op2 = imms(inst, 0);
      cpu->mcr.t = op1 < op2;
      break;
    }
    case 0x22: {  // CMPILS
      unsigned op1 = regs[inst.i.src1];
      unsigned op2 = imms(inst, 0);
      cpu->mcr.t = op1 <= op2;
      break;
    }
    case 0x23: {  // CMPILT
      signed op1 = regs[inst.i.src1];
      signed op2 = imms(inst, 0);
      cpu->mcr.t = op1 < op2;
      break;
    }
    case 0x24: {  // CMPILE
      signed op1 = regs[inst.i.src1];
      signed op2 = imms(inst, 0);
      cpu->mcr.t = op1 <= op2;
      break;
    }
    case 0x28: {  // CMPEQ
      unsigned op1 = regs[inst.s.src1];
      unsigned op2 = regs[inst.s.src2];
      cpu->mcr.t = op1 == op2;
      break;
    }
    case 0x29: {  // CMPLO
      unsigned op1 = regs[inst.s.src1];
      unsigned op2 = regs[inst.s.src2];
      cpu->mcr.t = op1 < op2;
      break;
    }
    case 0x2a: {  // CMPLS
      unsigned op1 = regs[inst.s.src1];
      unsigned op2 = regs[inst.s.src2];
      cpu->mcr.t = op1 <= op2;
      break;
    }
    case 0x2b: {  // CMPLT
      signed op1 = regs[inst.s.src1];
      signed op2 = regs[inst.s.src2];
      cpu->mcr.t = op1 < op2;
      break;
    }
    case 0x2c: {  // CMPLE
      signed op1 = regs[inst.s.src1];
      signed op2 = regs[inst.s.src2];
      cpu->mcr.t = op1 <= op2;
      break;
    }

    /* === Register Branch Instructions === */
    case 0x30: {  // RBRA
      unsigned op1 = regs[inst.i.src1];
      unsigned op2 = imms(inst, 2);
      if (op1 & 3) return fault(cpu, FAULT_LOAD);
      next = op1 + op2;
      break;
    }
    case 0x31: {  // RCALL
      if (regs[15] & 3) return fault(cpu, FAULT_STORE);
      unsigned op1 = regs[inst.i.src1];
      unsigned op2 = imms(inst, 2);
      if (op1 & 3) return fault(cpu, FAULT_LOAD);
      write32(regs[15] -= 4, cpu->pc + 4);
      next = op1 + op2;
      break;
    }
    case 0x32: {  // RET
      if (regs[15] & 3) return fault(cpu, FAULT_LOAD);
      unsigned res = read32(regs[15]);
      if (res & 3) return fault(cpu, FAULT_LOAD);
      regs[15] += 4, next = res;
      break;
    }
    case 0x38: {  // ROBRA
      unsigned op1 = regs[inst.s.src1];
      unsigned op2 = regs[inst.s.src2];
      if ((op1 + op2) & 3) return fault(cpu, FAULT_LOAD);
      next = op1 + op2;
      break;
    }
    case 0x39: {  // ROCALL
      if (regs[15] & 3) return fault(cpu, FAULT_STORE);
      unsigned op1 = regs[inst.s.src1];
      unsigned op2 = regs[inst.s.src2];
      if ((op1 + op2) & 3) return fault(cpu, FAULT_LOAD);
      write32(regs[15] -= 4, cpu->pc + 4);
      next = op1 + op2;
      break;
    }

    /* === Memory Access Instructions === */
    case 0x40: {  // LD
      unsigned op1 = regs[inst.i.src1];
      unsigned op2 = imms(inst, 2);
      if (op1 & 3) return fault(cpu, FAULT_LOAD);
      regs[inst.i.dest] = read32(op1 + op2);
      break;
    }
    case 0x41: {  // LDH
      unsigned op1 = regs[inst.i.src1];
      unsigned op2 = imms(inst, 1);
      if (op1 & 1) return fault(cpu, FAULT_LOAD);
      regs[inst.i.dest] = read16(op1 + op2);
      break;
    }
    case 0x42: {  // LDB
      unsigned op1 = regs[inst.i.src1];
      unsigned op2 = imms(inst, 0);
      regs[inst.i.dest] = read8(op1 + op2);
      break;
    }
    case 0x43: {  // ST
      unsigned op1 = regs[inst.i.src1];
      unsigned op2 = imms(inst, 2);
      if (op1 & 3) return fault(cpu, FAULT_STORE);
      write32(op1 + op2, regs[inst.i.dest]);
      break;
    }
    case 0x44: {  // STH
      unsigned op1 = regs[inst.i.src1];
      unsigned op2 = imms(inst, 1);
      if (op1 & 1) return fault(cpu, FAULT_STORE);
      write16(op1 + op2, regs[inst.i.dest]);
      break;
    }
    case 0x45: {  // STB
      unsigned op1 = regs[inst.i.src1];
      unsigned op2 = imms(inst, 0);
      write8(op1 + op2, regs[inst.i.dest]);
      break;
    }
    case 0x46: {  // LDC
      unsigned op1 = regs[inst.i.src1];
      unsigned op2 = imms(inst, 2);
      if (op1 & 3) return fault(cpu, FAULT_LOAD);
      cpu->mcr.val = read32(op1 + op2);
      break;
    }
    case 0x47: {  // STC
      unsigned op1 = regs[inst.i.src1];
      unsigned op2 = imms(inst, 2);
      if (op1 & 3) return fault(cpu, FAULT_STORE);
      write32(op1 + op2, cpu->mcr.val);
      break;
    }
    case 0x48: {  // RLD
      unsigned op1 = regs[inst.s.src1];
      unsigned op2 = regs[inst.s.src2];
      if ((op1 + op2) & 3) return fault(cpu, FAULT_LOAD);
      regs[inst.s.dest] = read32(op1 + op2);
      break;
    }
    case 0x49: {  // RLDH
      unsigned op1 = regs[inst.s.src1];
      unsigned op2 = regs[inst.s.src2];
      if ((op1 + op2) & 1) return fault(cpu, FAULT_LOAD);
      regs[inst.s.dest] = read16(op1 + op2);
      break;
    }
    case 0x4a: {  // RLDB
      unsigned op1 = regs[inst.s.src1];
      unsigned op2 = regs[inst.s.src2];
      regs[inst.s.dest] = read8(op1 + op2);
      break;
    }
    case 0x4b: {  // RST
      unsigned op1 = regs[inst.s.src1];
      unsigned op2 = regs[inst.s.src2];
      if ((op1 + op2) & 3) return fault(cpu, FAULT_STORE);
      write32(op1 + op2, regs[inst.s.dest]);
      break;
    }
    case 0x4c: {  // RSTH
      unsigned op1 = regs[inst.s.src1];
      unsigned op2 = regs[inst.s.src2];
      if ((op1 + op2) & 1) return fault(cpu, FAULT_STORE);
      write16(op1 + op2, regs[inst.s.dest]);
      break;
    }
    case 0x4d: {  // RSTB
      unsigned op1 = regs[inst.s.src1];
      unsigned op2 = regs[inst.s.src2];
      write8(op1 + op2, regs[inst.s.dest]);
      break;
    }
    case 0x4e: {  // POP
      if (regs[15] & 3) return fault(cpu, FAULT_LOAD);
      regs[inst.s.dest] = read32(regs[15]);
      break;
    }
    case 0x4f: {  // PUSH
      if (regs[15] & 3) return fault(cpu, FAULT_STORE);
      write32(regs[15] -= 4, regs[inst.s.dest]);
      break;
    }

    /* === Move Instructions === */
    case 0x50: {  // MOVI
      regs[inst.i.dest] = imms(inst, 0);
      break;
    }
    case 0x51: {  // MTI
      if (cpu->mcr.t == 0) break;
      regs[inst.i.dest] = imms(inst, 0);
      break;
    }
    case 0x52: {  // MFI
      if (cpu->mcr.t == 1) break;
      regs[inst.i.dest] = imms(inst, 0);
      break;
    }
    case 0x53: {  // MOVL
      unsigned res = inst.m.immLo;
      res |= (inst.m.immHi << 12);
      regs[inst.m.dest] |= res;
      break;
    }
    case 0x54: {  // MOVU
      unsigned res = inst.m.immLo;
      res |= (inst.m.immHi << 12);
      regs[inst.m.dest] = res << 16;
      break;
    }
    case 0x58: {  // MOV
      regs[inst.s.dest] = regs[inst.s.src1];
      break;
    }
    case 0x59: {  // MT
      if (cpu->mcr.t == 0) break;
      regs[inst.s.dest] = regs[inst.s.src1];
      break;
    }
    case 0x5a: {  // MF
      if (cpu->mcr.t == 1) break;
      regs[inst.s.dest] = regs[inst.s.src1];
      break;
    }
    case 0x5b: {  // MTOC
      if (cpu->mcr.mode == 0)
        return fault(cpu, FAULT_PRIVILEGE);
      cpu->mcr.val = regs[inst.s.dest];
      break;
    }
    case 0x5c: {  // MFRC
      regs[inst.s.dest] = cpu->mcr.val;
      break;
    }
    case 0x5d: {  // MTOU
      if (cpu->mcr.mode == 0)
        return fault(cpu, FAULT_PRIVILEGE);
      unsigned *user = cpu->bank - 8;
      if (inst.s.dest < 8) user = regs;
      user[inst.s.dest] = regs[inst.s.src1];
      break;
    }
    case 0x5e: {  // MFRU
      if (cpu->mcr.mode == 0)
        return fault(cpu, FAULT_PRIVILEGE);
      unsigned *user = cpu->bank - 8;
      if (inst.s.src1 < 8) user = regs;
      regs[inst.s.dest] = user[inst.s.src1];
      break;
    }

    /* === Shift Instructions === */
    case 0x60: {  // LSL
      unsigned op1 = regs[inst.i.src1];
      unsigned op2 = imms(inst, 0);
      regs[inst.i.dest] = op1 << (op2 & 31);
      break;
    }
    case 0x61: {  // LSR
      unsigned op1 = regs[inst.i.src1];
      unsigned op2 = imms(inst, 0);
      regs[inst.i.dest] = op1 >> (op2 & 31);
      break;
    }
    case 0x62: {  // ASR
      signed op1 = regs[inst.i.src1];
      unsigned op2 = imms(inst, 0);
      regs[inst.i.dest] = op1 >> (op2 & 31);
      break;
    }
    case 0x63: {  // ROR
      unsigned op1 = regs[inst.i.src1];
      unsigned op2 = imms(inst, 0) & 31;
      unsigned res = op1 << (32 - op2);
      regs[inst.i.dest] = (op1 >> op2) | res;
      break;
    }
    case 0x68: {  // RLSL
      unsigned op1 = regs[inst.s.src1];
      unsigned op2 = regs[inst.s.src2];
      regs[inst.s.dest] = op1 << (op2 & 31);
      break;
    }
    case 0x69: {  // RLSR
      unsigned op1 = regs[inst.s.src1];
      unsigned op2 = regs[inst.s.src2];
      regs[inst.s.dest] = op1 >> (op2 & 31);
      break;
    }
    case 0x6a: {  // RASR
      signed op1 = regs[inst.s.src1];
      unsigned op2 = regs[inst.s.src2];
      regs[inst.s.dest] = op1 >> (op2 & 31);
      break;
    }
    case 0x6b: {  // RROR
      unsigned op1 = regs[inst.s.src1];
      unsigned op2 = regs[inst.s.src2] & 31;
      unsigned res = op1 << (32 - op2);
      regs[inst.s.dest] = (op1 >> op2) | res;
      break;
    }
    case 0x6c: {  // FLSL
      unsigned op1 = regs[inst.f.src1];
      unsigned op2 = regs[inst.f.src2];
      unsigned op3 = regs[inst.f.rshift] & 31;
      unsigned res = op2 >> (32 - op3);
      regs[inst.f.dest] = (op1 << op3) | res;
      break;
    }
    case 0x6d: {  // FLSR
      unsigned op1 = regs[inst.f.src1];
      unsigned op2 = regs[inst.f.src2];
      unsigned op3 = regs[inst.f.rshift] & 31;
      unsigned res = op1 << (32 - op3);
      regs[inst.f.dest] = (op2 >> op3) | res;
      break;
    }

    /* === Control Instructions === */
    case 0x70: {  // STOP
      step = 1, next = cpu->pc;
      break;
    }
    case 0x71: {  // WFI
      return;
    }
    case 0x72: {  // SETT
      cpu->mcr.t = 1;
      break;
    }
    case 0x73: {  // CLRT
      cpu->mcr.t = 0;
      break;
    }
    case 0x74: {  // SWITCH
      if (cpu->mcr.mode == 0)
        return fault(cpu, FAULT_PRIVILEGE);
      cpu->mcr.val = cpu->omcr;
      next = cpu->fret;

      if (cpu->mcr.mode != 0) return;
      unsigned tmp_regs[8];
      memcpy(tmp_regs, regs + 8, 32);
      memcpy(regs + 8, cpu->bank, 32);
      memcpy(cpu->bank, tmp_regs, 32);
      break;
    }
    case 0x78: {  // SVCALL
      cpu->mcr.comment = regs[inst.s.dest];
      return fault(cpu, FAULT_SVCALL);
    }
    case 0x79: {  // FAULT
      if (cpu->mcr.mode == 0)
        return fault(cpu, FAULT_PRIVILEGE);
      cpu->mcr.comment = regs[inst.s.dest];
      return fault(cpu, regs[inst.s.src1] & 15);
    }
    case 0x7a: {  // MTOF
      if (cpu->mcr.mode == 0)
        return fault(cpu, FAULT_PRIVILEGE);
      cpu->fret = regs[inst.s.dest];
      break;
    }
    case 0x7b: {  // MFRF
      if (cpu->mcr.mode == 0)
        return fault(cpu, FAULT_PRIVILEGE);
      regs[inst.s.dest] = cpu->fret;
      break;
    }

    /* === PC-Relative Branch Instructions === */
    case 0x80: {  // BRA
      signed op1 = inst.b.offset;
      next = cpu->pc + ((op1 << 8) >> 6);
      break;
    }
    case 0x81: {  // BT
      if (cpu->mcr.t == 0) break;
      signed op1 = inst.b.offset;
      next = cpu->pc + ((op1 << 8) >> 6);
      break;
    }
    case 0x82: {  // BF
      if (cpu->mcr.t == 1) break;
      signed op1 = inst.b.offset;
      next = cpu->pc + ((op1 << 8) >> 6);
      break;
    }
    case 0x88: {  // CALL
      if (regs[15] & 3) return fault(cpu, FAULT_STORE);
      signed op1 = inst.b.offset;
      write32(regs[15] -= 4, cpu->pc + 4);
      next = cpu->pc + ((op1 << 8) >> 6);
      break;
    }
    case 0x89: {  // CT
      if (cpu->mcr.t == 0) break;
      if (regs[15] & 3) return fault(cpu, FAULT_STORE);
      signed op1 = inst.b.offset;
      write32(regs[15] -= 4, cpu->pc + 4);
      next = cpu->pc + ((op1 << 8) >> 6);
      break;
    }
    case 0x8a: {  // CF
      if (cpu->mcr.t == 1) break;
      if (regs[15] & 3) return fault(cpu, FAULT_STORE);
      signed op1 = inst.b.offset;
      write32(regs[15] -= 4, cpu->pc + 4);
      next = cpu->pc + ((op1 << 8) >> 6);
      break;
    }
    }
  }
}

int validELF(Elf32_Ehdr *ehdr) {
  if (memcmp(ehdr->e_ident, "\177ELF", 4)) return 0;
  if (ehdr->e_type != ET_EXEC) return 0;
  if (ehdr->e_machine != EM_MINA32) return 0;
  return 1;
}

int main(int argc, const char* argv[]) {
  if (argc != 2 && argc != 3)
    puts("Usage: ./simulator <ELF>"), exit(1);
  FILE *fd = fopen(argv[1], "r");
  if (!fd) puts("Can't open file"), exit(1);

  // Load ELF header
  Elf32_Ehdr ehdr;
  if (!fread(&ehdr, sizeof(ehdr), 1, fd))
    puts("Invalid ELF header"), exit(1);
  if (!validELF(&ehdr))
    puts("Invalid ELF header"), exit(1);

  // Load program headers
  Elf32_Phdr phdrs[ehdr.e_phnum];
  if (fseek(fd, ehdr.e_phoff, SEEK_SET))
    puts("Can't seek program headers"), exit(1);
  if (!fread(phdrs, sizeof(phdrs), 1, fd))
    puts("Can't read program headers"), exit(1);

  // Map each segment at offset
  for (int i = 0; i < ehdr.e_phnum; ++i) {
    if (phdrs[i].p_type != PT_LOAD) continue;
    if (fseek(fd, phdrs[i].p_offset, SEEK_SET))
      puts("Can't seek segment"), exit(1);
    unsigned char *seg = mem + phdrs[i].p_vaddr;
    if (!fread(seg, phdrs[i].p_filesz, 1, fd))
      puts("Can't read segment"), exit(1);
  }

  // Setup hdmi interface
  SDL_Init(SDL_INIT_VIDEO);
  SDL_SetHint(SDL_HINT_RENDER_VSYNC, "0");
  SDL_CreateWindowAndRenderer(640, 480, 0, &window, &renderer);
  SDL_SetRenderDrawColor(renderer, 0, 0, 0, 0);
  SDL_RenderClear(renderer);

  texture = SDL_CreateTexture(renderer, SDL_PIXELFORMAT_ARGB8888,
    SDL_TEXTUREACCESS_STREAMING, 320, 240);

  // Setup debugger
  mina_t cpu = {0};
  if (argc == 3) {
    int port = atoi(argv[2]);
    debug_t conf = {
      &cpu, read8, write8,
      read_reg, write_reg,
      set_break, clr_break,
      set_watch, clr_watch
    };
    debug_init(port, conf);
    handle_step();
  }

  // Start CPU at reset
  fault(&cpu, FAULT_RESET);
  return 0;
}
