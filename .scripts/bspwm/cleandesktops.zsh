#!/bin/zsh

DESKTOP=`bspc query -D -d .\\!occupied`
[[ $DESKTOP == "" ]] && exit

bspc desktop $DESKTOP -r

~/.scripts/bspwm/renamedesktop.zsh
