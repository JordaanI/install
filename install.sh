#!/bin/sh

set -e

# Source Utils

. $(pwd)/utils.sh

# Update System

echo "Updating System"
pacman -Syu --noconfirm

#install Dir

install=$(pwd)

## Set root password

echo "Set root Password:"
passwd

## Install yay

logExe "git clone https://aur.archlinux.org/yay.git"
cd yay
echo "Building yay"
makepkg -Sic

## Install stable packages

echo ""
echo ""
echo "Install all stable packages"

cd $install

while read package; do
    logExe "yay -S $package --noconfirm"
done < stable

echo "##### DONE #####"
echo ""
echo ""

