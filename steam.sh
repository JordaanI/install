#!/bin/sh

set -e

home="/home/$USER"

asUser () {
    logExe "sudo -u $USER $1"
}

## install yay

. $(pwd)/utils.sh

logExe "cd $home"
asUser "git clone https://aur.archlinux.org/yay.git"
logExe "cd yay"
asUser "makepkg -si --noconfirm"
logExe "cd $home"

## Install steam

asUser "yay -S steam-native-runtime"
