#!/bin/bash

killall "picom"
killall "sxhkd"
killall "lemonbar"
killall "controllemonbar"
killall "bash"
killall "bspc"
killall "xdotool"

bspc quit
