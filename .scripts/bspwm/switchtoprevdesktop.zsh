#!/bin/zsh

DESKTOPNAME=`xdotool get_desktop` 


if [[ $DESKTOPNAME == "0" ]]
then
  exit
fi

bspc desktop prev -f
bspc desktop next.\!occupied -r

I=0

for DESKTOP in `bspc query -D`
do
  bspc desktop $DESKTOP -n $I
  I=$(expr $I + 1)
done
