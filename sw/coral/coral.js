// dump image data

var pixels = Array(320 * 240);

for (let i = 0, y = 170; i < 240; i++, y++) {
  for (let j = 0, x = 270; j < 320; j++, x++) {
    pixels[i * 320 + j] = CC.bmp.pixels[y * 640 + x];
  }
}

var str = '';

for (let i = 0; i < 320 * 240; i += 4) {
  str += '0x';
  for (let j = 3; j >= 0; --j) {
    str += ('0' + (pixels[i + j] & 0xff).toString(16)).slice(-2);
  }
  str += ',';
  if (i % 32 == 28) {
    str += '\n';
  }
}

console.log(str);

// dump base palette

str = '';
let pal = CC.palettes.vw8g.baseColors;

for (let i = 0; i < 256; i++) {
  let str_r = ('0' + (pal[i].red & 0xff).toString(16)).slice(-2);
  let str_g = ('0' + (pal[i].green & 0xff).toString(16)).slice(-2);
  let str_b = ('0' + (pal[i].blue & 0xff).toString(16)).slice(-2);
  str += '0x' + str_r + str_g + str_b + ',';
}

console.log(str);

// dump color cycles

str = '';
let crt = CC.palettes.vw8g.cycles;

for (let i = 0; i < 16; i++) {
  let rate = Math.floor(273067 / crt[i].rate);
  str += `{${rate},${crt[i].low},${crt[i].high}},`;
}
