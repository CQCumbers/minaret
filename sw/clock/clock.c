#include <stdio.h>
#include <string.h>
#include "minaret.h"
#include "font.h"

static uint8_t clocks[4] = {  0, 0, 0, 0};
static uint8_t limits[4] = {100,60,60,24};
static char text[12];

const char digit_lut[200] = {
  '0','0','0','1','0','2','0','3','0','4','0','5','0','6','0','7','0','8','0','9',
  '1','0','1','1','1','2','1','3','1','4','1','5','1','6','1','7','1','8','1','9',
  '2','0','2','1','2','2','2','3','2','4','2','5','2','6','2','7','2','8','2','9',
  '3','0','3','1','3','2','3','3','3','4','3','5','3','6','3','7','3','8','3','9',
  '4','0','4','1','4','2','4','3','4','4','4','5','4','6','4','7','4','8','4','9',
  '5','0','5','1','5','2','5','3','5','4','5','5','5','6','5','7','5','8','5','9',
  '6','0','6','1','6','2','6','3','6','4','6','5','6','6','6','7','6','8','6','9',
  '7','0','7','1','7','2','7','3','7','4','7','5','7','6','7','7','7','8','7','9',
  '8','0','8','1','8','2','8','3','8','4','8','5','8','6','8','7','8','8','8','9',
  '9','0','9','1','9','2','9','3','9','4','9','5','9','6','9','7','9','8','9','9'
};

void sprint_clocks(char *buf, uint8_t *clocks) {
  for (int i = 4; i-- > 0;) {
    *buf++ = digit_lut[clocks[i] * 2 + 0];
    *buf++ = digit_lut[clocks[i] * 2 + 1];
    if (i != 0) *buf++ = ':';
  }
}

void draw_char(int x, int y, char chr) {
  // use pal[1] for text, pal[0] for background
  for (int i = 0; i < FONT_HIGH && y + i < 240; ++i) {
    uint8_t row = font_data[(uint8_t)chr * FONT_HIGH + i];
    for (int j = 0; j < FONT_WIDE && x + j < 320; ++j) {
      uint32_t pos = (y + i) * 320 + (x + j);
      MINA_HDMI_PIX[pos] = row >> 7, row <<= 1;
    }
  }
}

void draw_text(int x, int y, const char *str) {
  for (int left = x; *str != '\0'; ++str) {
    switch (*str) {
      case '\n': y += FONT_HIGH + 3, x = left; break;
      case '\r': y += FONT_HIGH + 3, x = left; break;
      case '\t': x += FONT_WIDE * 4; break;
      default: draw_char(x, y, *str), x += FONT_WIDE; break;
    }
  }
}

int main(int argc, char* argv[]) {
  // copy palette, clear image
  uint32_t pal[] = {0x000000,0xdd7744};
  memcpy(MINA_HDMI_PAL, pal, 8);
  memset(MINA_HDMI_PIX, 0, 320 * 240);

  for (;;) {
    // increment clocks
    uint32_t tick = MINA_TIMER + 10;
    for (int i = 0; i < 4; ++i) {
      if (++clocks[i] < limits[i]) break;
      clocks[i] = 0;
    }

    // update digit display
    sprint_clocks(text, clocks);
    draw_text(116, 116, text);
    while (MINA_TIMER < tick);
  }
}
