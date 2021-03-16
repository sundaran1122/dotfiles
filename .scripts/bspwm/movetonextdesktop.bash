#!/bin/bash

DESKTOPNAME=$(xdotool get_desktop)
DESKTOPNUMS=$(xdotool get_num_desktops)

echo $DESKTOPNAME

if [[ $DESKTOPNAME == $(expr $DESKTOPNUMS - 1) ]]
then
  bspc monitor -a ·
fi

bspc node focused -d next --follow
bspc desktop prev.\!occupied -r
