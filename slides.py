#! /usr/bin/python

import time
import os
import glob


class slide():
	def __init__(self, slideTime=30):
		self.imageNames = []
		self.slideTime = slideTime
		self.slice = 0
		
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
		
	def displayImage(self):
		imageName = self.imageNames[self.slice]
		
		bashCommand = "sudo fbi -T 2 --noverbose --once -t {seconds} {image}".format(seconds=self.slideTime, image=imageName)
		os.system(bashCommand)
		time.sleep(self.slideTime+3)
		
		self.slice += 1

	def exit(self):
		os.system("sudo kill $(pgrep fbi)")