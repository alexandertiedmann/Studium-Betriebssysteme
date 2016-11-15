#!/bin/bash
#Variablen
DATE=$(date)
DATEI=""
LINE=""
ZAHLER=0
JSONDATEI="$DATEI.json"

#Funktionen
readDAT(){
  if [ -z $1 ];then
    echo "Bitte eine Datei angeben"
    exit 1
  fi
  DATEI=$(echo $1)
  if [ ! -e $DATEI ]; then
    echo "Bitte andere Datei angeben"
    exit 1
  fi
  ZAEHLER=0
  while read LINE; do
    eins=$(echo $LINE | cut -d'=' -f1 | tr -d " ")
    zwei=$(echo $LINE | cut -d'=' -f2 | tr -d " " | sed "s/""'""//g")
      if [ ! -z "$eins" ] || [ ! -z "$zwei" ]; then
        ZAEHLER=$(($ZAEHLER +1))
	if [ -f "$JSONDATEI" ]; then
          echo " \"$zwei\" : \"$eins\"," >> $JSONDATEI
	fi
      fi
  done < $DATEI
}
speichern(){
  JSONDATEI=$DATEI.json
  echo "{" > $JSONDATEI
  readDAT $1
  if [ ! -z "$ZAEHLER" ]; then
    echo "}" >> $JSONDATEI
    cat $JSONDATEI
  else
    rm $JSONDATEI
  fi
}
config(){
  readDAT $1
  echo "count(key:value) = " $ZAEHLER 
}
schleife(){
  if [ -z $1 ] || [ -z $2 ]; then
    echo "execute.sh --schleife [ZAHL][DATEI]"
    exit 1
  fi
  DATEI=$2
  if [ ! -e $DATEI ]; then
    echo "Bitte andere Datei angeben"
    exit 1
  fi
  ZEILE=$1
  sed -n "$ZEILE"p $DATEI
  while read LINE;do
     ZAEHL=0
     for LINES in `cat $DATEI`;do
	if [ "$LINES" == "$LINE" ]; then
	  ZAEHL=$((ZAEHL + 1))
	fi
     done
     echo $ZAEHL
  done < $DATEI
}
#Main
case $1 in
--config)
	config $2
	;;
--speichern)
	speichern $2
	;;
--schleife)
	schleife $2 $3
	;;
--datum)
	echo $DATE
	;;
--eingabe)
	eingabe $2 $3
	;;
--help)
	echo "execute.sh [OPTION] [FILE]"
	echo "   --config,    gibt die Anzahl der Paare aus"
	echo "   --speichern, gibt eine JSON-Datei in das Verzeichnis mit den Paaren"
	echo "   --datum,     gibt das aktuelle Datum aus"
	echo "   --schleife,  gibt eine Zeile aus und zaehlt dann wie oft jede Zeile in der Datei vorkommt"
	;;
*)
	echo "Bitte geben Sie eine gueltige Option an"
	echo "execute.sh --help"
	exit 1
esac
