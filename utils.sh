#!/bin/sh

logExe() {
    echo "$1"
    eval "$1"
}

remove() {
    if [ -e "$1" ]; then
	echo "Removing $1"
	rm -rf "$1" 
    fi
}

: '
getopts example

while getopts 'xyz:v' flag; do
    case "${flag}" in
	x);;
	y);;
	z);;
	*);;
    esac
done

'
