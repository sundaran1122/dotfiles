#!/bin/zsh

I=0

for DESKTOP in `bspc query -D`
do
  bspc desktop $DESKTOP -n $I
  I=`python -c "print($I+1)"`
done
