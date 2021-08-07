//doomgeneric for minaret

#include "doomkeys.h"
#include "m_argv.h"
#include "doomgeneric.h"

#include <stdio.h>
#include <string.h>
#include <unistd.h>

#include <stdbool.h>
#include "minaret.h"

uint8_t *frame = 0;

void DG_Init()
{
}

void DG_DrawFrame()
{
  // copy screenbuffer to vmem
  uint8_t *dst = MINA_HDMI_PIX + 6400;
  uint32_t len = DOOMGENERIC_RESX * DOOMGENERIC_RESY;
  memcpy(dst, DG_ScreenBuffer, len);
}

void DG_SleepMs(uint32_t ms)
{
  mina_time_wait(ms);
}

uint32_t DG_GetTicksMs()
{
  return MINA_TIMER;
}

int DG_GetKey(int *pressed, unsigned char *doomKey)
{
  // read key event from queue
  // return 1 if event valid
  uint32_t data = MINA_KEYS;
  *pressed = !(data & 0x100);
  *doomKey = data & 0xff;
  return (data >> 15) & 0x1;
}

void DG_SetWindowTitle(const char * title)
{
}
