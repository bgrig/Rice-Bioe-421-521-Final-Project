#! /usr/bin/python

import serial
import os
import sys
import time
import re
import glob

import portComm
import slides
import gcoder


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
	
	slideshow = slides.slide()
	GCo = gcoder.gcode(filename="diagrid_s.gcode", commCl=rambo)

    	for slice in range(0,slideshow.totalSlices):
		delay = GCo.nextSliceMove()
		#delay = 1 #####dummy code to speed along run through
        	slideshow.displayNextImage(delay)
		print("slice: " + str(slice))

	slideshow.exit()
	rambo.closeComm()

main()

if '__name__' == '__main__':
	print("started")
    	main()



