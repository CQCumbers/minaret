"""
import intel_jtag_uart

ju = intel_jtag_uart.intel_jtag_uart()
with open('coral.hex') as f:
    for line in f:
        if ju.bytes_available():
            print(ju.read().decode())
        ju.write(line.encode())
"""

import serial
import time

serialPort = serial.Serial(
    port="COM3", baudrate=115200, timeout=2
)

with open('coral.hex') as f:
    for line in f:
        if serialPort.inWaiting() > 0:
            print(serialPort.readline().decode().strip())
        serialPort.write(line.encode())
