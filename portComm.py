#! /usr/bin/python

import serial

class Comm():
	def __init__(self, port='/dev/ttyACM0', baud=115200, device='RAMBO'):
		self.port = port
		self.baud = baud
		self.device = device
		self.ser = None
		self.timeout = 1
		self.wait = 1
		self.buffer = ''
		
		if self.device == 'RAMBO':
			self.initRAMBo() 



	#Open serial connection and cycle through initial Marlin Communication

	def initRAMBo(self):
		self.ser = serial.Serial(self.port, self.baud, timeout=self.timeout)
		rambo = self.ser
		rambo.open()
		
		response = ''
		text = ''
		while True:
			response = rambo.read(1000)
			if (response != ''):
				text += response
				response = ''
			else:
				print(text)
				break
			
	def writeLine(self, line):
		self.ser.write(line)

	def clearBuffer(self, required=False):
		timer = 0
		while True:
			response = self.ser.read(1000)
			print(response)
			self.buffer += response
			if response != '':
				required = False
			
			timer += 1
			if timer > 10000:
				break
			
			if response or required:
				continue
			else:
				break
		
		buffer = self.buffer
		self.buffer = ''
		return buffer
	
	
	
	
	
	def closeComm(self):	
		#Close serial communications
		self.ser.close()