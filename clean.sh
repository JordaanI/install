#!/bin/sh

pacman -Rns $(pacman -Qdtq) --noconfirm
pacman -Sc --noconfirm
