#!/bin/bash
#############VARIABLEN########
LVL=0
PUNKTE=0
PLUSPUNKTE=0
LVLFLAG=0
LRUNDEN=runden.txt
PLAYER=( spieler1 )
RUNDEN=50
############gibt zufaellige Punkte zwischen 1 und 10)##########
function getPunkte(){
  ZAHL=$(( ( RANDOM % 10 )  + 1 ))
  echo $ZAHL
}
###########wartet auf die naechste Runde########
function warte(){
	wait
}
##########gibt die letzten 10 Runden aus#########
function letzteRunden(){
  ZEILE=""
  ZEILE="[$GAMER]"
  ZEILE=$(echo "$ZEILE     +$PLUSPUNKTE Punkte -->")
  ZEILE=$(echo "$ZEILE     Punkte($PUNKTE)")
  ZEILE=$(echo "$ZEILE     Level($LVL)")
  if [ "$LVLFLAG" -eq "1" ];then
	ZEILE=$(echo "$ZEILE ++")
  fi
  LVLFLAG=0
  echo $ZEILE >> $LRUNDEN
}
#########level up########
function lvlUp(){
  LVL=$(($PUNKTE/10))
  LVLFLAG=1
}
#########geht zum naechsten Spieler######
function Go(){
  RUNDE=1
  LETZTEAUSGABE=1
  while [ $RUNDE -le $RUNDEN ]; do
    for GAMER in "${PLAYER[@]}"; do
	PLUSPUNKTE=$(getPunkte)
	PUNKTE=$((PUNKTE+$PLUSPUNKTE))
	TMP=$(($PUNKTE/10))
	if [ $TMP -gt $LVL ]; then
		lvlUp
	else
		LVLFLAG=0
	fi
	letzteRunden
	if [ $LETZTEAUSGABE -ge 10 ]; then
		echo "----------Naechste 10 Runden----------"
		cat $LRUNDEN
		LETZTEAUSGABE=0
		rm $LRUNDEN
	else
		LETZTEAUSGABE=$(($LETZTEAUSGABE+1))
	fi
    done
    RUNDE=$((RUNDE+1))
  done
}
##########################################Startpunkt des Spiels#############
echo "Die Anzahl der Runden die gepielt wird betraegt $RUNDEN"
Go
rm -f $LRUNDEN
