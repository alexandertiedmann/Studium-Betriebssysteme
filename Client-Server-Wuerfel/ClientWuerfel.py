######################################
# Client sends a value (number)
# and the server returns the thrown dice values.
######################################

from socket import *

# Definition der Socket-Parameter
host = "141.45.209.57" # IP-Adresse des Servers
port = 4711 # Port-Adresse des Servers
addr = (host,port)
buf = 128 # Max. Speicher fuer Eingangsdaten
data=""
ende=0
# Initialisierung eines UDP-Sockets
UDPSock = socket(AF_INET,SOCK_DGRAM)

def send(data):
	global addr
	global buf
	global UDPSock
	UDPSock.sendto(str(data),addr) # ... versenden
	(data,addr) = UDPSock.recvfrom(buf) # warten...
	print "Server: ", addr, " Nachricht: ", data
	if data=="KILL":
		UDPSock.close() # Socket beenden
		return 1
	else:
		return 0

while ende!=1 :
		data = raw_input("Wie oft soll gewuerfelt werden? ")
		ende=send(data)