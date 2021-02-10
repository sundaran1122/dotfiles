#!/bin/bash

# enviornment variables
export INSTALL="pacman -S"
export UPDATE="pacman -Syu"

#update stuff
$UPDATE

# setup specific to arch
$INSTALL xf86_intel_video xorg xorg-xinit alsa alsa-utils base-devel

# install stuff
$INSTALL neovim zsh
$INSTALL bspwm sxhkd
$INSTALL picom hsetroot betterlockscreen
$INSTALL dmenu fzf
$INSTALL kitty neofetch
