#!/bin/bash

function wuerfel(){
  ZAHL=$(( ( RANDOM % 6 )  + 1 ))
  echo $ZAHL
}

function wurf(){
  WURF="$(wuerfel) $(wuerfel) $(wuerfel) $(wuerfel) $(wuerfel) $(wuerfel)"
  echo $WURF
}

wurf
