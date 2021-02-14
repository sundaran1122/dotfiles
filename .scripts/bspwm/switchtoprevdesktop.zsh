#!/bin/zsh

DESKTOPNAME=`bspc query -D -d focused.occupied --names` 


if [[ $DESKTOPNAME == "1" ]]
then
  exit
fi

bspc desktop prev -f
bspc desktop next.\!occupied -r

I=1

for DESKTOP in `bspc query -D`
do
  bspc desktop ^$I -n $I
  I=$(expr $I + 1)
done
