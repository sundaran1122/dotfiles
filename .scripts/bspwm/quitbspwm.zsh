#!/bin/zsh

killall "picom"
killall "sxhkd"
killall "lemonbar"
killall "controllemonbar"
killall "zsh"
killall "bspc"

bspc quit
