#!/bin/env zsh

set -e

install=$(pwd)

. $install/utils.sh

banner "Install Gambit"

# Go to home directory
cd
mkdir Applications
mkdir devel
cd Applications

## Clone git

logExe "git clone https://github.com/gambit/gambit.git"
cd gambit

## Configure install with recommended specs
./configure --enable-single-host --enable-march=native --enable-dynamic-clib

## Make calls
cores=$(fastfetch | grep CPU | grep -o '([0-9]*)' | grep -o '[0-9]*')
make -j $cores
make check
sudo make install

## Setup utils

user=$(<"$install/user")

cd
cd devel
cp -r $install/gambit .
sudo chown -R "$user:" gambit


## Get gambit utilities

## TODO sign into gambit and get utils 
