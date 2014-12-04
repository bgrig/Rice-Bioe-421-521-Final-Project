#! /usr/bin/python

import serial
import re
import time

import portComm

class gcode():
	def __init__(self, filename='', commCl='', zBottom=6.15):
		self.comm = commCl
		self.zCount = 0
		self.zCurrent = 0
		self.zHome = 105
		self.zAfterHome = zBottom - self.zHome
		self.zRE = re.compile(" Z(-?[0-9]+[.]?[0-9]*)")
		self.M114RE = re.compile("Count X: ([0-9]+[.]?[0-9]*)Y:([0-9]+[.]?[0-9]*)Z:([0-9]+[.]?[0-9]*)")
		self.gmoveRE = re.compile("^G[0-1]{1}|28")
		self.filename = filename
		self.header = []
		self.gcodeDict = {}
		self.sliceCurrent = 0
		
		self.loadGcode(dir=".")
		
		self._prepare()



	def _prepare(self):
		self.gcodeLine("G28 Z\n")
		self.gcodeLine("G91\n")
		self.gcodeLine("G0 Z{0}\n".format(str(self.zAfterHome)))

	def gcodeLine(self, line):
		self.comm.writeLine(line)
		print(line.strip())

		self.waitOnMove(line)
		#self.clearBuffer()			

	def waitOnMove(self, line):
		print("waitOnMove Line: " + line.strip())
		MoveCheck = self.isMove(line)

		if not MoveCheck:
			print("Not a move")
			return
		else:
			print("Is a move")
		
		if re.search("G28", line):
			zDestination = 0
			self.zCount = self.zHome
		else:
			zSearch = self.zRE.search(line)
			zDestination = zSearch.group(1)
		
		print(line.strip())
		zDestination = float(zDestination) + float(self.zCount)
		print("Z coordinate: " + str(float(zDestination)))
		
		while True:
			self.checkPosition()
			print("Diff: " + str(float(self.zCurrent) - float(zDestination)))
			
			if (float(self.zCurrent) - float(zDestination))**2 < 0.01:
				self.zCount = zDestination
				break
				

	def checkPosition(self):
		commCl = self.comm
		while True:
			currPosition = ''

			commCl.writeLine("M114\n")
			currPosition = commCl.clearBuffer(required=True)
			
			if len(currPosition) < 2:
				print("Current Position not found")
				continue

			currXYZ = self.M114RE.search(currPosition)
			print(currPosition)

			zCurr = currXYZ.group(3)
			print("Current Z: " + str(zCurr))
			break

		self.zCurrent = zCurr
		
	def parseHeader(self):
		header = []
		gcodeFile = self.gcodeFile
		for line in gcodeFile:
			if re.search("Header End", line):
				break
			header.append(line)
		self.header = header

	def parseGcode(self):
		gcodeDict = {}
		slice = -1
		sliceGcode = []
		delay = -1
		
		gcodeFile = self.gcodeFile
		for line in gcodeFile:      
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
			gcodeSlice = gcodeDict[key]

			for i in range(0,len(gcodeSlice)):
				line = gcodeSlice[i]
				line = re.sub("^;", "", line, count=1)
				gcodeSlice[i] = line
			
			gcodeDict[key] = gcodeSlice
		self.gcodeDict = gcodeDict

	def loadGcode(self, dir="."):
		pathname = "./{0}/{1}".format(dir, self.filename)
		self.gcodeFile = open(pathname, "r")
		
		#parse GCODE
		self.parseHeader()
		self.parseGcode()

	def nextSliceMove(self):
		slice = str(self.sliceCurrent)
		gcode = self.gcodeDict[slice][1:]
		for i in range(0,len(gcode)):
			self.gcodeLine(gcode[i])

		delay = self.gcodeDict[slice][0]
		self.sliceCurrent += 1
		
		return int(delay) / 1000
		
	def isMove(self, line):
		return True if self.gmoveRE.search(line) else False
		
