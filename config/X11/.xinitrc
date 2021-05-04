#!/bin/sh

export userresources=~/.Xresources
export usermodmap=~/.Xmodmap
export sysresources=/etc/X11/xinit/.Xresources
export sysmodmap=/etc/X11/xinit/.Xmodmap
export XDG_CONFIG_HOME=~/.config

exec bspwm
