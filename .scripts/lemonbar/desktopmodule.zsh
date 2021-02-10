#!/bin/zsh

DESKTOP=`bspc query -D -d focused --names`
bspc query -D --names | tr "\n" " " \
  | sed "s/$DESKTOP/%{B#3B4252}%{F#ECEFF3}%{+u} $DESKTOP %{B-}%{F-}%{-u}/g"
