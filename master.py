#! /usr/bin/python

import serial
import os
import sys
import time
import re
import glob
import picamera
import smtplib
from email.MIMEMultipart import MIMEMultipart
from email.MIMEBase import MIMEBase
from email.MIMEText import MIMEText
from email import Encoders

#Start an instance of picamera
camera = picamera.PiCamera() 

#Output stdout to log file
sys.stdout = open("log.txt", "a")

#Port Definitions
port = "/dev/ttyACM0"
baud = 115200

#counts
zCount = 0

#Regular Expression Compilation
###Regular expressions to identify coordinates of the form 0+.0+
xRE = re.compile(" X(-?[0-9]+[.]?[0-9]*)")
yRE = re.compile(" Y(-?[0-9]+[.]?[0-9]*)")
zRE = re.compile(" Z(-?[0-9]+[.]?[0-9]*)")  

###Regular expression to parse an M114 command output and obtain the x, y, and z coordinate values
M114 = re.compile("Count X: ([0-9]+[.]?[0-9]*)Y:([0-9]+[.]?[0-9]*)Z:([0-9]+[.]?[0-9]*)")

### Regular expression to check if the initial section of a Gcode contains a movement 
### command (G0, G1, or G28)
Gmove = re.compile("^G[0-1]{1}|28")

#Timeout length
serTimeout = 1 #timeout for serial communication
wait = 1 #seconds to wait before releasing hold on rambo communications

# Z home coordinate
ZHOME = 105 # mm; constant for the value marlin stores as the z-value after homing

#Initialize Log information
print("##################")
print(time.strftime("Log: %Y/%m/%d %I:%M:%S"))
print(port)
print("baudrate: " + str(baud) + "\n")


#Open serial connection
rambo = serial.Serial(port, baud, timeout=serTimeout)
rambo.open()

#Cycle through Marlin initial communications
### Marlin outputs certain information to the serial port after initializing a connection
### This code just clears the output
timer = 0 #Timer allows for the buffer to catch all communication (pauses briefly to make
# sure that buffer is clear
while True:
    response = rambo.read(10000)    
    if response != '':
        timer = 0    
        print(response.strip())
    else:
        timer += 1
    if timer == 3:
        break


# Quick function to check if something is a move command
def isMove(line):
    result = Gmove.search(line)

    if result:
        return True
    else:
        return False

# Function to clear the serial connection buffer between movement commands
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

# Function for waiting on z-home command
def homeWait(zFinal, ser=rambo):
    print("Z coordinate: " + str(zFinal))
    time.sleep(1)
    
    # Loop that queries for the current position (M114 command), parses the command
    # for the z-coordinate, and compares the z-coordinate with the desired destination
    # coordinate to determine if the movement has finished
    while True:
        currPosition = ''
       
        ser.write("M114\n")
        timer = 0
        
        #Loop to get the M114 coordinates
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
        
        #If the buffer value does not exist, then the M114 command has not responded
        if len(currPosition) < 2:
            print("Current Position not found")
            continue
        
        #Parse M114 command and find position.
        currXYZ = M114.search(currPosition)
        print(currPosition)

        zCurr = currXYZ.group(3)
        print("Current Z: " + str(zCurr))

        #Compare destination zValue with current z-position and end wait period if the values are the same        
        if ((float(zCurr) - float(zFinal))**2 < 0.01):
            global zCount
            zCount = ZHOME
            time.sleep(1)
            break

#See comments on waitHome function (just above); Same basic structure, but for G0/1 commands
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

# Function to send gcode Lines over the serial connection.
def gcodeLine(line, ser=rambo):
    ser.write(line)
    print(line.strip())

    waitOnMove(line, ser)
    #clearBuffer(ser)

# Uses fbi to change the background to a completely black background
def initBackground():
    os.system("sudo fbi -T 2 --noverbose ./Background/solid_black.jpg")
    time.sleep(5)

    # Save timestamp on filename
    filename = time.st rftime("%Y-%m-%d_%H%M", time.localtime())
    output_name = 'test%s.jpg' %filename 

    camera.capture(output_name)

    # Acct from which email will be sent
    gmail_user = "XXXX@gmail.com"
    gmail_pwd = "XXXX"

    # Defining components of email
    def mail(to, subject, text, attach):
        msg = MIMEMultipart()

        msg['From'] = gmail_user
        msg['To'] = to
        msg['Subject'] = subject

        msg.attach(MIMEText(text))

        part = MIMEBase('application', 'octet-stream')
        part.set_payload(open(attach, 'rb').read())
        Encoders.encode_base64(part)
        part.add_header('Content-Disposition','attachment; filename="%s"' %os.path.basename(attach))
        msg.attach(part)

        mailServer = smtplib.SMTP("smtp.gmail.com", 587)
        mailServer.ehlo()
        mailServer.starttls()
        mailServer.ehlo()
        mailServer.login(gmail_user, gmail_pwd)
        mailServer.sendmail(gmail_user, to, msg.as_string())
        # Should be mailServer.quit(), but that crashes...
        mailServer.close()

    #Send message with text
    mail("XXXX@gmail.com",
        "Hello from python!",
        "This is a email sent with python",
        output_name)

    time.sleep(1)

    #either remove the file or move it to another dir
    os.remove(output_name)

    return

# Uses fbi to display a specified image for a specified number of seconds
def displayImage(imageName, seconds):
    bashCommand = "sudo fbi -T 2 --noverbose --once -t {0} {1}".format(seconds, imageName)
    os.system(bashCommand)
    time.sleep(seconds+3)

# kills the fbi command to return the system to the original GUI terminal
def exitFBI():
    os.system("sudo kill $(pgrep fbi)")

# Loads all images from the specified directory
def loadSlideshow(dir,ext="png"):
    pathname = "./{0}/*.{1}".format(dir, ext)
    images = glob.glob(pathname)
    images.sort()
    return images

# Dummy function to look inside the Creation Workshop output gcode and identify 
# commands/information prior to actual slicing information
def parseHeader(f):
    header = []
    for line in f:
        if re.search("Header End", line):
            break
        header.append(line)
    return header

# Parse function to examine Creation workshop output gcode and output a dictionary
# of the form key => value; slice# => series of gcode commands for that slice
# Note: a slice is a 2D cross-section of the final 3D image.
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
        
# Overview function to parse the header and parse the gcode from a creation workshop file
# Can be expanded to do other functions (very primitive right now)
def loadGcode(filename, dir="Gcode"):
    pathname = "./{0}/{1}".format(dir, filename)
    f = open(pathname, "r")
    
    #parse GCODE
    header = parseHeader(f)
    gcode = parseGcode(f)
    
    return gcode

# Main code segment
def main():  
    # Changes the background of the output screen to black
    initBackground()

    # Home the z-axis and prepare for movement
    gcodeLine("G28 Z\n")
    #gcodeLine("G21\n")
    gcodeLine("G91\n")
    gcodeLine("G0 Z-10\n")

    # Load image names from file
    images = loadSlideshow("Testing")

    # Load the gcode data from the creation workshop file
    gcodeDict = loadGcode("0.3-0.5mm_holes_horizontal_short.gcode", ".")

    # Iterate through the slice numbers and execute gcode movements/slideshow image displays with correct timing
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

main()

if '__name__' == '__main__':
    main()



