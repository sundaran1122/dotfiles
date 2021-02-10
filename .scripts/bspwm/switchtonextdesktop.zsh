#!/bin/zsh

DESKTOPNUM=`bspc query -D | wc -l`

~/.scripts/bspwm/cleandesktops.zsh

if [[ $(bspc query -D -d focused --names) == $DESKTOPNUM ]]
then
  bspc monitor -a $(expr $DESKTOPNUM + 1)
fi

bspc desktop -f next
