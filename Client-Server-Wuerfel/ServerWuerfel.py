######################################
# Client sends a value (number)
# and returns the thrown dice values.
######################################
from random import randint
from socket import *

def wuerfel():
	augenzahl = randint(1, 6)
	return augenzahl

def wurf(anzahl):
	k = [0] * 6
	for x in range(anzahl):
		zahl = wuerfel()
		k[zahl-1]=k[zahl-1]+1
	return k

addr = ("127.0.0.1",4711) # Server-Adresse
buf = 128 # Max. Speicher fuer Eingangsdaten

UDPSock = socket(AF_INET, SOCK_DGRAM)
UDPSock.bind(addr) #Server an Adresse binden:

print "Server is now listing %s and port %s" % addr
while 1: #er lauscht auf Port 4711
	data,addr = UDPSock.recvfrom(buf) #lauschen..
	if data:
		print "FROM Client: ", addr, " Nachricht: ", data
		try:
			val = int(data)
			blubb = str(wurf(val))
			print "return : ", blubb
			UDPSock.sendto(blubb, addr)
		except ValueError:
			UDPSock.sendto("That's not a number .... :)",addr)
	else:  #Falls 0 Bytes: Abbruch!
		UDPSock.sendto("KILL", addr)
		print "Der User hat den Server beendet!"
		break
UDPSock.close() #Socket beenden