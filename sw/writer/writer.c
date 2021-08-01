#include <stdio.h>
#include <string.h>
#include "minaret.h"
#include "font.h"

static char text[0x100000];
static char pix[320 * 240];

void draw_char(char *pix, int x, int y, char chr) {
  // use pal[1] for text, pal[0] for background
  for (int i = 0; i < FONT_HIGH && y + i < 240; ++i) {
    uint8_t row = font_data[(uint8_t)chr * FONT_HIGH + i];
    for (int j = 0; j < FONT_WIDE && x + j < 320; ++j) {
      uint32_t pos = (y + i) * 320 + (x + j);
      pix[pos] = row >> 7, row <<= 1;
    }
  }
}

void draw_text(char *pix, int x, int y, const char *str) {
  for (int left = x; *str != '\0'; ++str) {
    switch (*str) {
      case '\n': y += FONT_HIGH + 3, x = left; break;
      case '\r': y += FONT_HIGH + 3, x = left; break;
      case '\t': x += FONT_WIDE * 4; break;
      default: draw_char(pix, x, y, *str), x += FONT_WIDE; break;
    }
  }
}

char shifted(char key) {
  // capitalize letters
  if (key >= 'a' && key <= 'z')
    return key & 0x5f;

  // use alternate symbols
  switch (key) {
    case '`': return '~';
    case '1': return '!';
    case '2': return '@';
    case '3': return '#';
    case '4': return '$';
    case '5': return '%';
    case '6': return '^';
    case '7': return '&';
    case '8': return '*';
    case '9': return '(';
    case '0': return ')';
    case '-': return '_';
    case '=': return '+';
    case '[': return '{';
    case ']': return '}';
    case '\\': return '|';
    case ';': return ':';
    case '\'': return '"';
    case ',': return '<';
    case '.': return '>';
    case '/': return '?';
    default: return key;
  }
}

int main(int argc, char* argv[]) {
  // setup text pointers
  char *rptr = text, *wptr = text;
  char *last = text + sizeof(text);
  uint32_t shift = 0, lines = 0;

  // copy palette
  uint32_t frame = 0, key = 0;
  uint32_t pal[] = {0x000000,0xdd7744};
  memcpy(MINA_HDMI_PAL, pal, 8);

  for (;;) {
    // wait for next frame
    while (MINA_TIMER < frame);
    frame = MINA_TIMER + 16, *wptr = '_';

    // process inputs
    while ((key = MINA_KEYS) & 0x8000) {
      if ((key & 0xff) == 0xb6)
        shift = !(key & 0x100);
      if (key & 0x100) continue;

      switch (key &= 0xff) {
        default:
          if (wptr + 1 >= last) break;
          *wptr++ = shift ? shifted(key) : key; break;
        case 0x1b: case 0x7f: case 0xa3: case 0xb6:
        case 0xac: case 0xad: case 0xae: case 0xaf:
          break;
        case 0xa2:  // insert spaces
          if (wptr + 1 >= last) break;
          *wptr++ = ' '; break;
        case 0x08:  // scroll back on backspace
          if (wptr <= text) break;
          if (*--wptr == '\r' && lines-- >= 20)
            while (--rptr > text && rptr[-1] != '\r');
          wptr[1] = '\0'; break;
        case 0x0d:  // scroll forward on return
          if (wptr + 1 >= last) break;
          if (wptr[1] == '\0' && ++lines >= 20)
            while (rptr < wptr && *rptr++ != '\r');
          *wptr++ = '\r'; break;
      }
    }

    // double buffer image
    memset(pix, 0, sizeof(pix));
    *wptr = '_', draw_text(pix, 8, 8, rptr);
    memcpy(MINA_HDMI_PIX, pix, sizeof(pix));
  }
}
