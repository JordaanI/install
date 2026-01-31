#!/bin/sh

echo "Remove Orphans"
pacman -Rns $(pacman -Qdtq)

echo "Clean Caches"
yay -Sc

