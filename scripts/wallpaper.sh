#!/bin/sh

# Sets a random wallpaper with hyprpaper

sleep 1
wallpapers=($(ls $HOME/.wallpapers))

wall=${wallpapers[ $RANDOM % ${#wallpapers[@]} ]}
path="$HOME/.wallpapers/$wall"
echo "$path" > $HOME/.wallpaper

hyprctl hyprpaper unload all
hyprctl hyprpaper preload "$path"
hyprctl hyprpaper wallpaper ",$path"
