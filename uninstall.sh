#!/bin/sh

. $(pwd)/utils.sh

if [ $(whoami) != "root" ]; then
    echo "Root only"
    exit 1
fi

if [ -z "$1" ]; then
    echo "Specify user to uninstall"
    exit 1
fi

if [ "$1" == "root" ]; then
    echo "lmao"
    exit 1
fi    

## remove user 

logExe "userdel -r $1"

## remove all installed packages

essential=(base base-devel linux linux-firmware nano iwd git)

for package in $(pacman -Qeq); do
    echo "Checking for: $package"
    if [[ ! " ${essential[*]} " =~ " $package " ]]; then
	pacman -Rns "$package"
    fi
done
