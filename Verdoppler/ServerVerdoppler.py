#########################
# Server awaits a client value (number)
# and returns the double of it.
#########################

from socket import *

addr = ("141.45.208.132",4711) # Server-Adresse
buf = 128 # Max. Speicher fuer Eingangsdaten

UDPSock = socket(AF_INET, SOCK_DGRAM)
UDPSock.bind(addr) #Server an Adresse binden:

print "Server is now listing %s and port %s" % addr
while 1: #er lauscht auf Port 4711
    data,addr = UDPSock.recvfrom(buf) #lauschen..
    if data:
        print "Client: ", addr, " Nachricht: ", data
        try:
            val = int(data)
            UDPSock.sendto("%d" % (val*2), addr)
        except ValueError:
            UDPSock.sendto("That's not a number .... :)",addr)
    else:  #Falls 0 Bytes: Abbruch!
        UDPSock.sendto("KILL", addr)
        print "Der User hat den Server beendet!"
        break
UDPSock.close() #Socket beenden