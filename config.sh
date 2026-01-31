#!/bin/sh

set -e

. utils.sh

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
echo "source -- $ZDOTDIR/.zshenv" > "$home/.zshenv"
zprofile="$home/.config/zsh/.zprofile"


echo "Creating Profile"
logExe "rm $zprofile"
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

## setup scripts

echo "Setup scripts"

logExe "cp -r scripts $home"

## Config Setup Done

echo "### Config Setup Done ###"

## Setting Permisisons

logExe "chown -r $user: $home/.config"
logExe "chown -r $user: $home/scripts"
logExe "chmod u+x $home/scripts/*.sh" 
