#!/bin/zsh
bspc monitor -a `bspc query -D | wc -l`
bspc desktop -f next
