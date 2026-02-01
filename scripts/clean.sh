#!/bin/sh

#Update system
pacman -Syu --noconfirm

echo "Remove Orphans"
pacman -Rns $(pacman -Qtdq)

echo "Clean Caches"
yay -Sc

