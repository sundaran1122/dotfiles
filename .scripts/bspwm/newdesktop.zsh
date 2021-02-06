#!/bin/zsh
DESKTOPNUM=`bspc query -D | wc -l`

bspc monitor -a $DESKTOPNUM
bspc desktop -f $DESKTOPNUM
