#! /usr/bin/python

import serial
import os
import sys
import time

#Output stdout to log file
sys.stdout = open("log.txt", "a")

#Port Definitions
port = "/dev/ttyACM0"
baud = 115200

#Timeout length
serTimeout = 1 #timeout for serial communication
wait = 3 #seconds to wait before releasing hold on rambo communications

#Initialize Log information
print("##################")
print(time.strftime("Log: %Y/%m/%d %I:%M:%S"))
print(port)
print("baudrate: " + str(baud) + "\n")


#Open serial connection
rambo = serial.Serial(port, baud, timeout=serTimeout)
rambo.open()

#Cycle through Marlin initial communications
timer = 0
while True:
    response = rambo.read(10000)    
    if response != '':
        timer = 0    
        print(response.strip())
    else:
        timer += 1
    if timer == 3:
        break


#Definitions
def gcodeLine(line, ser=rambo):
    ser.write(line)
    print(line.strip())
    
    timer = 0
    while True:
        response = ser.read(10000)
        
        if response == 'ok\n':
            print(response.strip())
            ser.write("M400\n")
            break
        elif response != '':
            timer = 0    
            print(response.strip())
        else:
            timer += 1

        if timer == wait:
            break


os.system("sudo fbi -T 2 ./Testing/cylinder_10mm0001.png")

#Print Test Gcode
gcodeLine("G28 Z\n")
gcodeLine("G0 Z80 F1000\n")
gcodeLine("G0 Z60 F300\n")
gcodeLine("G0 Z100 F500\n")
gcodeLine("M114\n")
gcodeLine("G90\n")


#Close rambo serial communications
rambo.close()

