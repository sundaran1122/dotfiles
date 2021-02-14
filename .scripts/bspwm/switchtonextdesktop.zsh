#!/bin/zsh

DESKTOPNAME=`bspc query -D -d focused --names`

if [[ $DESKTOPNAME == `bspc query -D | wc -l` ]]
then
  bspc monitor -a desktop
fi

bspc desktop -f next
bspc desktop prev.\!occupied -r

I=1

for DESKTOP in `bspc query -D`
do
  bspc desktop ^$I -n $I
  I=$(expr $I + 1)
done
