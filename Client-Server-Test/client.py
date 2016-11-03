#!/usr/bin/python
from socket import *
			# Definition der Socket-Parameter
host = "127.0.0.1" # IP-Adresse des Servers
port = 4711 # Port-Adresse des Servers
addr = (host,port)
buf = 128 # Max. Speicher fuer Eingangsdaten
			# Initialisierung eines UDP-Sockets
UDPSock = socket(AF_INET,SOCK_DGRAM)
data = "Hallo Server!" # Nachricht ...
#data = "" #Nachicht mit 0 Byte (Beednet den Server)
UDPSock.sendto(data,addr) # ... versenden
(data,addr) = UDPSock.recvfrom(buf) # warten...
print "Server:", addr, " Nachricht:", data
UDPSock.close() # Socket beenden