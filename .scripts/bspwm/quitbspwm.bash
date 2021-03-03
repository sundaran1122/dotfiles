#!/bin/bash

killall "picom"
killall "sxhkd"
killall "lemonbar"
killall "controllemonbar"
killall "bash"
killall "bspc"

bspc quit
