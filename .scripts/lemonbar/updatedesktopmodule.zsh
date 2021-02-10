#!/bin/zsh

while true
do
bspc subscribe -c 1 desktop_focus desktop_add desktop_remove && killall -SIGUSR1 controllemonbar
done
