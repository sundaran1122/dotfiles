#!/bin/zsh

DESKTOPNUM=`bspc query -D | wc -l`

~/.scripts/bspwm/cleandesktops.zsh

if [[ `bspc query -D -d focused --names ` -eq $(expr $DESKTOPNUM - 1) ]]
then
  bspc monitor -a $DESKTOPNUM
fi

bspc desktop -f next
