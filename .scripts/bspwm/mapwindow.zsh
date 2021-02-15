#!/bin/zsh

windows=""

for window in $(bspc query -N -n .hidden.window -d focused)
do
  windows="$windows\n$(xdotool getwindowname $window)"
done

windowtomap=$(echo -e $windows | dmenu -nb "#2E3440" -nf "#D8DEE9" \
  -sb "#3B4252" -sf "#ECEFF4" \
  -fn "Mononoki" -p "map:" -i -l 20 \
)

for window in $(xdotool search --name $windowtomap)
do
bspc node $window -g hidden=false
done
