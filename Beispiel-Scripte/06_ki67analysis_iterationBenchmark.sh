#!/usr/bin/env sh

{ while true ; do { for i in "4"; do time { printf "$(date)\t${i}\t" && ./05_ki67analysis_executing.sh ${i}| tail -n 1;  }   ; done; } done;} | tee -a scores.log
