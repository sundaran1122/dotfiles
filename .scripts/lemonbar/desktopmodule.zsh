#!/bin/zsh

DESKTOP=`bspc query -D -d focused --names`
bspc query -D --names | tr "\n" " " \
  | sed "s/$DESKTOP/%{F#2E3440}%{B#D8DEE9}$DESKTOP%{F-}%{B-}/g"
