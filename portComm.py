#! /usr/bin/python

import serial

class Comm():
	def __init__(self, port = '/dev/ttyACM0' , baud = 115200, device='RAMBO'):
		self.port = port
		self.baud = baud
		self.device = device
		self.ser = None
		self.timeout = 1
		self.wait = 1
		self.buffer = ''
		
		#self.initRAMBo() if self.device='RAMBO'



	#Open serial connection and cycle through initial Marlin Communication

	def initRAMBo(self):
		self.ser = serial.Serial(port, baud, timeout=serTimeout)
		rambo = self.ser
		rambo.open()
		
		while response = rambo.read(1000) and response != '':
			print(response.strip())
			
	def writeLine(self, line):
		self.ser.write(line)

	def clearBuffer(self, required=False):
		timer = 0
		while True:
			response = self.ser.read(1000)
			print(response)
			self.buffer += response
			required = False if response
			
			timer += 1
			break if timer > 10000
			
			continue if response or required else break
		
		buffer = self.buffer
		self.buffer = ''
		return buffer
	
	
	
	
	
	def closeComm(self):	
		#Close serial communications
		self.ser.close()