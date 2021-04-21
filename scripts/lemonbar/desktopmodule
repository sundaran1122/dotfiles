#!/bin/bash

DESKTOPS=$(bspc query -D --names | tr "\n" " ")
FOCUSDESKTOP=$(xdotool get_desktop)
OUTPUT=""

I=0
for DESKTOP in $DESKTOPS
do
  if [[ $I == $FOCUSDESKTOP ]]
  then
    OUTPUT="$OUTPUT%{+u}%{F#ECEFF4}%{B#3B4252} · %{B-}%{F-}%{-u}"

    I=$(expr  $I + 1)
    continue
  fi

  OUTPUT="$OUTPUT $DESKTOP "
  I=$(expr  $I + 1)
done

echo $OUTPUT | tr "\n" "\0"
