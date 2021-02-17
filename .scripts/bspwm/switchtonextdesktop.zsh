#!/bin/zsh

DESKTOPNAME=$(xdotool get_desktop)
DESKTOPNUMS=$(xdotool get_num_desktops)

echo $DESKTOPNAME

if [[ $DESKTOPNAME == $(expr $DESKTOPNUMS - 1) ]]
then
  bspc monitor -a $DESKTOPNAME
fi

bspc desktop -f next
bspc desktop prev.\!occupied -r

I=0

for DESKTOP in `bspc query -D`
do
  bspc desktop $DESKTOP -n $I
  I=$(expr $I + 1)
done
