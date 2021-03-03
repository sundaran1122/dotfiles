#!/bin/bash

bspc node -t fullscreen
xdotool search --class Bar windowunmap

HIDDENWINDOWS="$(bspc query -N -n .\!focused.window.\!hidden.local)"

for WINDOW in $HIDDENWINDOWS
do
  bspc node $WINDOW -g hidden=true
done

bspc subscribe node_state -c 1  > /dev/null
xdotool search --class Bar windowmap

for WINDOW in $HIDDENWINDOWS
do
  bspc node $WINDOW -g hidden=false
done
