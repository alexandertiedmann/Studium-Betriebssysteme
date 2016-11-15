#!/bin/bash
if [ -z $1 ] || [ -z $2 ];then
	echo "Bitte zwei Parameter angeben"
	exit 1
else
	if [ $1 -gt $2 ]; then
		echo "Bitte geben Sie zwei natuerliche Zahlen an"
		echo "Die zweite Zahl muss groesser sein als die erste"
		exit 1
	fi
fi

ZAEHLER=$2
ERG=0

while [ $ZAEHLER -ge $1 ]; do
	ERG=$(($ERG+$ZAEHLER))
	ZAEHLER=$(($ZAEHLER-1))
done

echo $ERG
