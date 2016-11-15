#!/bin/bash
getMemoryPerCore(){
 if [ -z "$1" ] || [  -z "$2" ]; then
   echo "Bitte Anzahl der Cores und RAM Groesse angeben."
   exit 1
 fi
 CORES=$1
 RAM=$2
 ERG=$(($RAM / $CORES))
 echo $ERG
}
getCpuCores(){
 #CORES=$(cat /proc/cpuinfo | grep "cpu cores" | sed "s/\ //g" | cut -d":" -f2)
 read CORES
 echo $CORES
}
getTotalMemory(){
 #Hier nehme ich MB da sonst nur 1GB als Wert genommen wird und alles
 #groesser 1 waere spaeter 0
 RAM=$(free -m | grep "Mem" | tr -s " " | cut -d" " -f2)
 echo $RAM
}
getMetrics(){
 CORES=$(getCpuCores)
 RAM=$(getTotalMemory)
}
getMetrics
getMemoryPerCore $CORES $RAM
