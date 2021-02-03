#!/bin/bash

# enviornment variables
export INSTALL="pacman -S"
export UPDATE="pacman -Syu"

#update stuff
$UPDATE

# setup specific to arch
$INSTALL xf86_intel_video xorg xorg-xinit alsa alsa-utils

# install stuff
$INSTALL neovim zsh
$INSTALL bspwm sxhkd lemonbar picom nitrogen
$INSTALL kitty neofetch
