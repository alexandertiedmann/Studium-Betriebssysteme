#!/bin/bash

time { for i in $(seq 22); do echo -n "pluto${i}: "; ping -t 1 -Q -o -c 1 pluto${i}.f4.htw-berlin.de | head -n 2 | tail -n 1 ; done }

