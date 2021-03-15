#!/bin/bash

for window in $(bspc query -N -n .hidden.window -d focused)
do
  windows="$windows\n$(xdotool getwindowname $window)"
done

windowname="$(echo -e $windows | sort | uniq | dmenu -nb "#2E3440" -nf "#D8DEE9" \
  -sb "#3B4252" -sf "#ECEFF3" \
  -fn "Mononokai" -p "map:" -i -l 20)"

for tomapwindow in $(xdotool search --desktop $(xdotool get_desktop) --name "$windowname")
do
  bspc node "$tomapwindow" -g hidden=false
done
