#! /usr/bin/python

import serial
import os
import sys
import time
import re
import glob

import portComm
import slides
#import gcoder


#Output stdout to log file
#sys.stdout = open("log.txt", "a")

#Port Definitions
port = "/dev/ttyACM0"
baud = 115200

#Timeout length
timeout = 1 #timeout for serial communication
wait = 1 #seconds to wait before releasing hold on rambo communications

def main():  
    #Initialize Log information
	print("##################")
	print(time.strftime("Log: %Y/%m/%d %I:%M:%S"))
	print(port)
	print("baudrate: " + str(baud) + "\n")
	
	rambo = portComm.Comm(port=port, baud=baud, device='RAMBO')
	
	#slideshow = slide()
	#slideshow.displayImage()
	#slideshow.exit()
	
	#gco = gcode(filename="0.3-0.5mm_holes_horizontal_short.gcode", commCl=rambo)


    	#gcodeLine("G28 Z\n")
    	##gcodeLine("G21\n")
    	#gcodeLine("G91\n")
    	#gcodeLine("G0 Z-10\n")

    	# gcodeDict = loadGcode("0.3-0.5mm_holes_horizontal_short.gcode", ".")

    	# for slice in range(0,len(gcodeDict)):
        	# gcode = gcodeDict[str(slice)]
        	# delay = gcode[0]
    
        	# for i in range(1, len(gcode)):
            		# line = gcode[i]
            		# gcodeLine(line)
    
        	# imageName = images[slice]
        	# seconds = int(delay) / 1000
        	# displayImage(imageName, seconds)

main()

if '__name__' == '__main__':
	print("started")
    	main()



