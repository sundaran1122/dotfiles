#!/bin/bash

DESKTOPNAME=$(xdotool get_desktop)


if [[ $DESKTOPNAME == "0" ]]
then
  exit
fi

bspc node focused -d prev
bspc desktop prev -f
bspc desktop next.\!occupied -r
