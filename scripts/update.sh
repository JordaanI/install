#!/bin/sh

#Update system
pacman -Syu --noconfirm

echo "Remove Orphans"
pacman -Rns $(pacman -Qtdq) --noconfirm

echo "Clean Caches"
pacman -Sc --noconfirm

echo "Update Wallpapers"
/home/$(whoami)/scripts/build-wallpapers.sh
