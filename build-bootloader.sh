#!/bin/env zsh

install=$(pwd)

set -e

. $install/utils.sh

banner "Setup Bootloader"

bootname="$(<"/etc/hostname")Boot"

if [[ $(efibootmgr | grep "$bootname" ) ]]; then
    echo "Boot entry already exists"
    exit 0
fi

disk="$1"
diskpath="/dev/$disk"
###$(<"$install/cpu") | 
ctl=$(fastfetch | grep CPU | cut -d' ' -f2)

if [[ $(echo "$ctl" | grep Intel) ]]; then
    ct=intel
else
    ct=amd
fi

uuid=$(lsblk --fs | grep ext4 | grep "$disk" |cut -d' ' -f9)

bootloader_args="--disk $diskpath --label \"$bootname\" --loader /vmlinuz-linux --unicode 'root=UUID=$uuid rw initrd=\\$ct-ucode.img initrd=\initramfs-linux.img'"

lsblk --fs
echo ""
echo "CHECK ARGS"
echo "$bootloader_args"
echo ""

while read "continue?Use these args? (y/n): "; do
    case "$continue" in
	y|yes)
	    logExe "efibootmgr --create $bootloader_args"
	    break
	    ;;
	n|no)
	    echo "Exiting Now. Its on you now boo"
	    exit 1
	    ;;
	*)
	    echo "use (y)es/(n)0"
    esac
done
