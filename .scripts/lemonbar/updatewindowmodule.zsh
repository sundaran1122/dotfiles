#!/bin/zsh

while true
do
  bspc subscribe -c 1 node_add node_remove node_focus && killall -SIGUSR2 controllemonbar
done
