#!/bin/env zsh

set -e

install=$(pwd)

# Source Utils

. "$install/utils.sh"

# Update System

echo "Updating System"
logExe "pacman -Syu --noconfirm"

#install Dir

## Set root password

echo "Setting Root Password"
password=$(<"$install/password")
logExe "yes $password | passwd"

## Install stable packages

echo ""
echo ""
echo "Install all stable packages"

cd $install

while read package; do
    logExe "pacman -S $package --noconfirm"
done < "$install/stable"

echo "##### DONE #####"
echo ""
echo ""

