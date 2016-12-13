#/usr/bin/env python

class Test:

	def __init__(self):
		print "Konstruktur aufgerufen"
		
		self.__halloTest = "Hallo"

	def tueWas(self):
		pass

	def tueEtwasAnderes(self):
		pass

	def sagHallo(self):
		print self.__halloTest


foo = Test()
foo.sagHallo()
