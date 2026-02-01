#!/bin/sh


## install yay

. $(pwd)/utils.sh

logExe "cd $HOME"
logExe "git clone https://aur.archlinux.org/yay.git"
logExe "cd yay"
logExe  "makepkg -si --noconfirm"
logExe "cd $home"

## Install steam

logExe "yay -S steam-native-runtime"

## Clean up

logExe "$home/scripts/clean.sh"
