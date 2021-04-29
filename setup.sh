#!/bin/bash

# install stuff
doas ./install.sh
./aur.sh

# set symlinks
ln -sf ~/dotfiles/config ~/.config
ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/zshenv ~/.zsenv
ln -sf ~/dotfiles/scripts ~/.scripts

# wallpapers!
mkdir -p ~/wallpapers
