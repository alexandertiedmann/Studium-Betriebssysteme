#!/usrbin/python
from socket import *
addr = ("127.0.0.1",4711) # Server-Adresse
buf = 128 # Max. Speicher fuer Eingangsdaten
UDPSock = socket(AF_INET, SOCK_DGRAM)
UDPSock.bind(addr) # Server an Adresse binden:
while 1: # er lauscht auf Port 4711
	data,addr = UDPSock.recvfrom(buf)# lauschen..
	if data:
		print "Client:", addr, " Nachricht:",data
		UDPSock.sendto("Hallo Client!",addr)
	else: # Falls 0 Bytes: Abbruch!
		break
UDPSock.close() # Socket beenden