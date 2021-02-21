#!/bin/zsh

bspc node -t fullscreen

HIDDENWINDOWS=$(bspc query -N -n .window.\!focused.\!hidden -d focused)

for WINDOW in $HIDDENWINDOWS
do
  bspc node $WINDOW -g hidden=true
done

bspc subscribe node_state -c 1 

for WINDOW in $HIDDENWINDOWS
do
  bspc node $WINDOW -g hidden=false
done
