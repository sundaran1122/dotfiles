#!/bin/bash

kill -$1 $(ps aux | awk '{print $2 " " $11}' | \
	dmenu -nb "#2E3440" -nf "#D8DEE9" \
  -sb "#3B4252" -sf "#ECEFF3" \
  -fn "Mononokai" -p "run:" -i -l 10 \
  | cut -d " " -f 1)
