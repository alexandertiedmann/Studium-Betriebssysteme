#!/usr/bin/python
from socket import *
	# Definition der Socket-Parameter
host = "141.45.208.132" # IP-Adresse des Servers
port = 4711 # Port-Adresse des Servers
addr = (host,port)
buf = 128 # Max. Speicher fuer Eingangsdaten
	
UDPSock = socket(AF_INET,SOCK_DGRAM) # Initialisierung eines UDP-Sockets

#def checkNum(x):
#	try:
#		x=int(x)
#	except ValueError:
#		print("Ist kein Integer")
#		return False
#	return True

def send(data):
	global addr
	global buf
	global UDPSock
	UDPSock.sendto(str(data),addr) # ... versenden
	(data,addr) = UDPSock.recvfrom(buf) # warten...
	print "Server:", addr, " Nachricht:", data
	if data=="KILL":
		UDPSock.close() # Socket beenden
		return 1
	else:
		return 0
	
data=""
ende=0
while ende!=1 :
		data = raw_input("Zahl die verdoppelt werden soll: ")
		ende=send(data)