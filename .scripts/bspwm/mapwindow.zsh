#!/bin/zsh

windowname=""

for window in $(bspc query -N -n .hidden.window -d focused)
do
  windowname="$windowname\n$(xdotool getwindowname $window)"
done

windowid=$(echo -e $windowname | dmenu -nb "#2E3440" -nf "#D8DEE9" \
  -sb "#3B4252" -sf "#ECEFF3" \
  -fn "Mononokai" -p "map:" -i)

for window in $(xdotool search  --desktop $(xdotool get_desktop) --name $windowid)
do
  bspc node $window -g hidden=false
done
