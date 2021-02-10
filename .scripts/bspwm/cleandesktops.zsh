#!/bin/zsh

for DESKTOP in `bspc query -D -d .\!occupied`
do
  bspc desktop $DESKTOP -r
done
