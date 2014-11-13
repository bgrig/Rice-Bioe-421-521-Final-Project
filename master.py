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
Gmove = re.compile("^G[0-1]{1}|28")

#Timeout length
serTimeout = 1 #timeout for serial communication
wait = 1 #seconds to wait before releasing hold on rambo communications

# Z home coordinate
ZHOME = 105

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

def clearBuffer(ser):
    timer = 0
    while True:
        response = ser.read(1000)
        
        if response:
            continue
        elif timer == 1:
            break
        else:
            timer += 1

#Definitions
def waitOnMove(line, ser):
    print("waitOnMove Line: " + line.strip())
    MoveCheck = isMove(line)

    if not MoveCheck:
        print("Not a move")
        return
    print("Is a move")
    
    if re.search("G28", line):
        z_destination = ZHOME
    else:
        #x_destination = xRE.search(line)
        #y_destination = yRE.search(line)
        z_search = zRE.search(line)
        z_destination = z_search.group(1)
    
    print("Z coordinate: " + str(z_destination))
    
    time.sleep(1)
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
        if len(currPosition) < 2:
            print("Current Position not found")
            continues

        currXYZ = M114.search(currPosition)
        print(currPosition)

        zCount = currXYZ.group(3)
        print("Count: " + str(zCount))
        
        if (int(zCount) == int(z_destination)):
            time.sleep(1)
            break

def gcodeLine(line, ser=rambo):
    ser.write(line)
    print(line.strip())

    waitOnMove(line, ser)
    clearBuffer(ser)

def displayImage(imageName, seconds):
    bashCommand = "sudo fbi -T 3 --noverbose --once -t {0} ./Testing/{1}".format(seconds, imageName)
    os.system(bashCommand)
    #time.sleep(seconds+3)


os.system("sudo fbi -T 2 --noverbose ./Slideshow/solid_black.jpg")
time.sleep(5)
#displayImage("cylinder_10mm0001.png", 5)
os.system("sudo kill $(pgrep fbi)")

#Print Test Gcode
#gcodeLine("G28 Z\n")
#gcodeLine("G0 Z80 F1000\n")
#gcodeLine("G0 Z60 F300\n")
#gcodeLine("G0 Z100 F500\n")


#Close rambo serial communications
rambo.close()

