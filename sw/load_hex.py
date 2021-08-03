#!/usr/bin/env python3
import serial, sys, time

def main():
    # Open 115200 baud UART
    serialPort = serial.Serial(
        port="COM3", baudrate=115200, timeout=2
    )

    # Send .hex file to bootloader
    print(f'Loading {sys.argv[1]}')
    with open(sys.argv[1]) as f:
        for line in f:
            if serialPort.inWaiting() > 0:
                print(serialPort.readline().decode().strip())
            serialPort.write(line.encode())

    # Listen for responses
    while True:
        if serialPort.inWaiting() > 0:
            print(serialPort.readline().decode().strip())

if __name__ == '__main__':
    main()
