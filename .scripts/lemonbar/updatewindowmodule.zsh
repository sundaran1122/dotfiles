#!/bin/zsh

while true
do
  (bspc subscribe node_add node_remove node_focus | cat | echo) && killall -SIGUSR2 controllemonbar
done
