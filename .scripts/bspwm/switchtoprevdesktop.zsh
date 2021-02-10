#!/bin/zsh

DESKTOPNUM=`bspc query -D | wc -l`
DESKTOPNAME=`bspc query -D -d focused.occupied --names` 

~/.scripts/bspwm/cleandesktops.zsh

if [[ $DESKTOPNAME == "1" ]]
then
  exit
fi

if [[ $DESKTOPNAME == "" ]]
then
  exit
fi

bspc desktop prev -f
