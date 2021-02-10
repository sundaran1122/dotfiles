#!/bin/zsh

DESKTOPNUM=`bspc query -D | wc -l`

~/.scripts/bspwm/cleandesktops.zsh

if [[ `bspc query -D -d focused --names` -eq 0 ]]
then
  exit
fi

bspc desktop prev -f
