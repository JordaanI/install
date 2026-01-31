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

## Install stable packages

echo ""
echo ""
echo "Install all stable packages"

cd $install

while read package; do
    logExe "pacman -S $package --noconfirm"
done < $(pwd)/stable

echo "##### DONE #####"
echo ""
echo ""

