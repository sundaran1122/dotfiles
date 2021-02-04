#!/bin/bash

# install stuff
sudo ./install.sh

# set symlinks
ln -sf ~/dotfiles/.config ~/.config
ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/scripts ~/.scripts

# wallpapers!
mkdir -p ~/wallpapers
curl -s https://i.imgur.com/SBKjnxm.png > ~/wallpapers/wallpaper.png
