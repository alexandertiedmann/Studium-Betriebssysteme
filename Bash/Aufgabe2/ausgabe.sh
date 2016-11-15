#!/bin/bash
DATEI=namen.dat

while read LINE; do
	echo $LINE | cut -d' ' -f2-
done < $DATEI
