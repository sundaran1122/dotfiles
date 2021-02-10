#!/bin/zsh

I=1

for DESKTOP in `bspc query -D`
do
  bspc desktop $DESKTOP -n $I
  I=$(expr $I + 1)
done
