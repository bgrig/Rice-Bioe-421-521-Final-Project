#! /usr/bin/python

import serial
import re
import time

from portComm import comm

class gcode():
	def __init__(self, filename='', commCl=comm()):
		self.comm = commCl
		self.zCount = 0
		self.zCurrent = 0
		self.zHome = 105
		self.zRE = re.compile(" Z(-?[0-9]+[.]?[0-9]*)")
		self.M114RE = re.compile("Count X: ([0-9]+[.]?[0-9]*)Y:([0-9]+[.]?[0-9]*)Z:([0-9]+[.]?[0-9]*)")
		self.gmoveRE = re.compile("^G[0-1]{1}|28")
		self.filename = filename
		self.header = []
		self.gcodeDict = {}
		self.sliceCurrent = 0
		
		self.loadGcode(dir=".")
		
		self._prepare():



	def _prepare(self):
		self.gcodeLine("G28 Z\n")
		##self.gcodeLine("G21\n")
		#self.gcodeLine("G91\n")
		#self.gcodeLine("G0 Z-10\n")

	def gcodeLine(self, line):
		self.comm.writeLine(line)
		print(line.strip())

		self.waitOnMove(line)
		#self.clearBuffer()			

	def waitOnMove(self, line):
		print("waitOnMove Line: " + line.strip())
		MoveCheck = self.isMove(line)

		if not MoveCheck:
			print("Not a move") and return
		else:
			print("Is a move")
		
		if re.search("G28", line):
			zDestination = 0
			self.zCount = self.zHome
		else:
			zSearch = self.zRE.search(line)
			zDestination = zSearch.group(1)
		
		print(line)
		print("Z coordinate: " + str(float(zDestination)))
		zDestination = float(zDestination) + float(self.zCount)
		
		while True:
			self.checkPosition()
			
			if ((float(self.zCurrent) - float(self.zDestination))**2 < 0.01):
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
		
	def isMove(self, line):
		return True if self.gmoveRE.search(line) else False
		