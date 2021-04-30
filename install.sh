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
$INSTALL dmenu skim xdotool xdo fd yad dex
$INSTALL termite neofetch

mkdir ~/.packs
cd ~/.packs
git clone https://aur.archlinux.org/paru.git
cd paru 
makepkg -si
