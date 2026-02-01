#!/bin/sh

set -e

. $(pwd)/utils.sh

echo "Setting up configs"

## Create user

read -p "Enter desired username: " user

logExe "useradd -m -G wheel --shell /bin/zsh $user"
echo "set password for user"
logExe "passwd $user"

## Pakcage configs

this=$(pwd)
home="/home/$user"

echo "Setup package configs"

## copy config dir to home

logExe "cp -r config $home/.config"

## Setup w3m

logExe "cp -r config/w3m $home/.w3m"

## Setup zsh

echo "Setting up Zsh"
echo "ZDOTDIR=$home/.config/zsh" > "$home/.zshenv"
echo "source -- $ZDOTDIR/.zshenv" >> "$home/.zshenv"
zprofile="$home/.config/zsh/.zprofile"


echo "Creating Profile"
remove "$zprofile"
logExe "touch $zprofile"

toZprofile () {
    echo "$1"
    echo "$1" >> "$zprofile"
 }
toZprofile "## Path Expansions ##"
toZprofile "export PATH=$PATH:$home/scripts"
toZprofile ""
toZprofile "## Editor ##"
toZprofile "export EDITOR='emacs -nw'"

## Setup ly

echo "Setup Ly"

logExe "systemctl disable getty@tty1.service"
logExe "systemctl enable ly@tty1.service"

## setup scripts

echo "Setup scripts"

logExe "cp -r scripts $home"

## Config Setup Done

echo "### Config Setup Done ###"

## Setting Permisisons

logExe "chown -R $user: $home/.config"
logExe "chown -R $user: $home/scripts"
logExe "chown -R $user: $home/.w3m"
logExe "chown $user: $home/.zshenv"
logExe "chmod u+x $home/scripts/*.sh"

## Build wallpapers

logExe "sudo -u $user $home/scripts/build-wallpapers.sh"

## Install Steam

asUser () {
    logExe "sudo -u $user $1"
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

## Clean up

logExe "$home/scripts/clean.sh"
