#!/bin/sh

## From https://github.com/AymanLyesri/ArchEclipse/blob/master/.config/hypr/maintenance/WALLPAPERS.sh


download_wallpapers() {
    echo "Downloading wallpapers..."
    
    # Folder to save the images
    folder="$HOME/.wallpapers"
    mkdir -p "$folder"
    
    # Track filenames from URLs
    expected_files=()
    
    while read url; do
        filename=$(basename "$url")
        expected_files+=("$filename")
        filepath="$folder/$filename"
        
        if [[ -f "$filepath" ]]; then
            echo "$filename already exists. Skipping download."
        else
            echo "Downloading $filename..."
            curl -L -o "$filepath" "$url"
        fi
    done < $HOME/scripts/urls
    
    # Cleanup files not in the list
    echo "Cleaning up files not in the list..."
    for file in "$folder"/*; do
        basename_file=$(basename "$file")
        if [[ ! " ${expected_files[*]} " =~ " $basename_file " ]]; then
            echo "Removing $basename_file"
            rm "$file"
        fi
    done
    
    echo "Done."
}


download_wallpapers
