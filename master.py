#! /usr/bin/python

import serial
import os
import sys
import time
import re

#Output stdout to log file
#sys.stdout = open("log.txt", "a")

#Port Definitions
port = "/dev/ttyACM0"
baud = 115200

#Regular Expression Compilation
xRE = re.compile(" X([0-9]+)?\.?[0-9]* ")
yRE = re.compile(" Y([0-9]+)?\.?[0-9]* ")
zRE = re.compile(" Z([0-9]+)?\.?[0-9]* ")  

M114 = re.compile("Count X: ([0-9]+)\.[0-9]+Y:([0-9]+)\.[0-9]+Z:([0-9]+)\.[0-9]+")

Gmove = re.compile("^G[0-1]{1}")

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

def isMove(line):
    result = Gmove.search(line)

    if result:
        return True
    else:
        return False

#Definitions
def waitOnMove(line, ser):
    MoveCheck = isMove(line)

    if not MoveCheck:
        print("Not a move")
        return
    print("Is a move")
 
    #x_destination = xRE.search(line)
    #y_destination = yRE.search(line)
    z_destination = zRE.search(line)
    
    print("Z coordinate: " + z_destination.group(1))

    while True:
        currPosition = ''

        ser.write("M114\n")
        timer = 0
        while True:
            response = ser.read(1000)
            response.strip()
            print("timer: " + str(timer))       

            if response != '':
                currPosition = currPosition + response
                print("Current position: " + currPosition)
                timer = 0
            elif timer == wait:
                break
            else:
                timer += 1
        print("Response: " + str(response))
        currXYZ = M114.search(currPosition)
        print(currPosition)

        print("Count: " + str(currXYZ.group(3)))
        
        #CurrXYZ.group(1) == x_current and currXYZ.group(2) == y_current and currXYZ.group(3) == z_current
        if (int(currXYZ.group(3)) == int(z_destination)):
            time.delay(1)
            break

def gcodeLine(line, ser=rambo):
    ser.write(line)
    print(line.strip())

    waitOnMove(line, ser)

    #timer = 0
    #while True:
        #response = ser.read(10000)
        
        #if response == 'ok\n':
            #print(response.strip())

            #break
        #elif response != '':
        #    timer = 0    
        #    print(response.strip())
        #else:
        #    timer += 1

        #if timer == wait:
        #   break


#os.system("sudo fbi -T 2 ./Testing/cylinder_10mm0001.png")

#Print Test Gcode
gcodeLine("G28 Z\n")
gcodeLine("G0 Z80 F1000\n")
gcodeLine("G0 Z60 F300\n")
gcodeLine("G0 Z100 F500\n")


#Close rambo serial communications
rambo.close()

