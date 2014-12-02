#! /usr/bin/python

import serial
import os
import sys
import time
import re
import glob

#Output stdout to log file
#sys.stdout = open("log.txt", "a")

#Port Definitions
port = "/dev/ttyACM0"
baud = 115200

#counts
zCount = 0

#Regular Expression Compilation
xRE = re.compile(" X(-?[0-9]+[.]?[0-9]*)")
yRE = re.compile(" Y(-?[0-9]+[.]?[0-9]*)")
zRE = re.compile(" Z(-?[0-9]+[.]?[0-9]*)")  

M114 = re.compile("Count X: ([0-9]+[.]?[0-9]*)Y:([0-9]+[.]?[0-9]*)Z:([0-9]+[.]?[0-9]*)")
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

def homeWait(zFinal, ser=rambo):
    print("Z coordinate: " + str(zFinal))
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
            continue

        currXYZ = M114.search(currPosition)
        print(currPosition)

        zCurr = currXYZ.group(3)
        print("Current Z: " + str(zCurr))
        
        if ((float(zCurr) - float(zFinal))**2 < 0.01):
            global zCount
            zCount = ZHOME
            time.sleep(1)
            break

def waitOnMove(line, ser=rambo):
    global zCount
    print("waitOnMove Line: " + line.strip())
    MoveCheck = isMove(line)

    if not MoveCheck:
        print("Not a move")
        return
    print("Is a move")
    
    if re.search("G28", line):
        homeWait(ZHOME)
        return
    else:
        #x_destination = xRE.search(line)
        #y_destination = yRE.search(line)
        z_search = zRE.search(line)
        z_destination = z_search.group(1)
    
    print(line)
    print("Z coordinate: " + str(float(z_destination)))
    z_destination = float(z_destination) + float(zCount)
    
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

        zCurr = currXYZ.group(3)
        print("Current Z: " + str(zCurr))
        print("Destination Z: " + str(z_destination))
        
        if ((float(zCurr) - float(z_destination))**2 < 0.01):
            zCount = z_destination
            time.sleep(1)
            break

def gcodeLine(line, ser=rambo):
    ser.write(line)
    print(line.strip())

    waitOnMove(line, ser)
    #clearBuffer(ser)

def initBackground():
    os.system("sudo fbi -T 2 --noverbose ./Background/solid_black.jpg")
    time.sleep(5)
    
    return

def displayImage(imageName, seconds):
    bashCommand = "sudo fbi -T 2 --noverbose --once -t {0} {1}".format(seconds, imageName)
    os.system(bashCommand)
    time.sleep(seconds+3)

def exitFBI():
    os.system("sudo kill $(pgrep fbi)")

def loadSlideshow(dir,ext="png"):
    pathname = "./{0}/*.{1}".format(dir, ext)
    images = glob.glob(pathname)
    images.sort()
    return images

def parseHeader(f):
    header = []
    for line in f:
        if re.search("Header End", line):
            break
        header.append(line)
    return header

def parseGcode(f):
    gcodeDict = {}
    slice = -1
    sliceGcode = []
    delay = -1

    for line in f:      

        if re.search(";<Slice> [0-9]+", line):
            match = re.search("([0-9]+)", line)
            slice = match.group(1)
            #print("Slice: " + slice)
        elif delay != -1 and re.search(";<Delay>", line):
            continue
        elif slice != -1 and re.search(";<Delay> [0-9]+", line):
            match = re.search("([0-9]+)", line)
            delay = match.group(1)
            #print("Delay: " + delay)
            sliceGcode.append(delay)
        elif delay != -1 and re.search("[GM][0-9]+", line):
            #print("Gcode: " + line)
            match = re.search("([GM][0-9]+.+\n)", line)
            if re.search("G[0-1]{1} ", line):
                gcode = match.group(1)
                sliceGcode.append(gcode)
        elif delay != -1 and re.search("Pre.{1}Slice End", line):
            #print("\n")
            gcodeDict[slice] = sliceGcode
            slice = -1
            delay = -1
            sliceGcode = []
    
    for key in gcodeDict:
        gcode = gcodeDict[key]

        for i in range(0,len(gcode)):
            line = gcode[i]
            line = re.sub("^;", "", line, count=1)
            gcode[i] = line
        
        gcodeDict[key] = gcode

    
    return gcodeDict
        

def loadGcode(filename, dir="Gcode"):
    pathname = "./{0}/{1}".format(dir, filename)
    f = open(pathname, "r")
    
    #parse GCODE
    header = parseHeader(f)
    gcode = parseGcode(f)
    
    return gcode

def main():  
    initBackground()


    gcodeLine("G28 Z\n")
    #gcodeLine("G21\n")
    gcodeLine("G91\n")
    gcodeLine("G0 Z-10\n")

    images = loadSlideshow("Testing")
    gcodeDict = loadGcode("0.3-0.5mm_holes_horizontal_short.gcode", ".")

    for slice in range(0,len(gcodeDict)):
        gcode = gcodeDict[str(slice)]
        delay = gcode[0]
    
        for i in range(1, len(gcode)):
            line = gcode[i]
            gcodeLine(line)
    
        imageName = images[slice]
        seconds = int(delay) / 1000
        displayImage(imageName, seconds)


    #Close rambo serial communications
    rambo.close()

def main2():
    
    images = loadSlideshow("Testing")
    for image in images:
        initBackground()
        displayImage(imageName, 5)
    

main()

if '__name__' == '__main__':
    main()



