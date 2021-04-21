#!/bin/sh

while true
do
  bspc subscribe -c 1 node_add node_remove node_focus &> /dev/null && killall -SIGUSR2 controllemonbar
done
