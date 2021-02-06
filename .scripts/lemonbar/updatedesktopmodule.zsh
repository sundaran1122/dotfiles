#!/bin/zsh

while true
do
(bspc subscribe desktop_focus desktop_add desktop_remove | cat | echo) && killall -SIGUSR1 controllemonbar
done
