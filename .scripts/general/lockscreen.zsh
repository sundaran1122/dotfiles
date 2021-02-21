#!/bin/zsh

maim -m 1 -u /tmp/lockscreen.png

convert /tmp/lockscreen.png -paint 1 -swirl 180 /tmp/lockscreen.png

i3lock -i /tmp/lockscreen.png
