#! /usr/bin/python

import time
import os
import glob


class slide():
	def __init__(self):
		self.imageNames = []
		self.sliceCurrent = 0
		self.totalSlices = None
		
		self.loadSlideshow(dir='Testing', ext='png')
		self.initBackground()

	# Initialize Solid Background on screen
	def initBackground(self):
		os.system("sudo fbi -T 2 --noverbose ./Background/solid_black.jpg")
		time.sleep(3)
		return
		
		
	# Load all slideshow images from Slideshow directory
	def loadSlideshow(self, dir='.',ext="png"):
		pathname = "./{0}/*.{1}".format(dir, ext)
		images = glob.glob(pathname)
		images.sort()
		self.imageNames = images
		self.totalSlices = len(images)
		
	def displayNextImage(self, delay):
		imageName = self.imageNames[self.sliceCurrent]
		
		bashCommand = "sudo fbi -T 2 --noverbose --once -t {seconds} {image}".format(seconds=delay, image=imageName)
		os.system(bashCommand)
		time.sleep(delay+2)
		
		self.sliceCurrent += 1
		

	def exit(self):
		os.system("sudo kill $(pgrep fbi)")