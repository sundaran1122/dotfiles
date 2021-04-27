#!/bin/bash

# enviornment variables
export INSTALL="pacman -S"
export UPDATE="pacman -Syu"

#update stuff
$UPDATE

# install stuff
$INSTALL neovim zsh
$INSTALL bspwm sxhkd
$INSTALL picom hsetroot
$INSTALL dmenu skim xdotool xdo fd yad
$INSTALL termite neofetch

mkdir ~/packages
cd ~/packages
git clone https://aur.archlinux.org/paru.git
cd paru 
makepkg -si
