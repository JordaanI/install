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

if [ "$1" != "debug" ]; then
    logExe "userdel -r $1"
fi

## remove all installed packages

packages=($(pacman -Qeq))
essential=(base base-devel linux linux-firmware nano iwd git)

echo "$packages"

for package in ${(@)packages:#*ucode*}; do
    echo "Checking for: $package"
    if [[ ! " ${essential[*]} " =~ " $package " ]]; then
	echo "$package"
	##pacman -Rns "$package" --noconfirm
    fi
done
