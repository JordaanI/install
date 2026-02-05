#!/bin/env zsh

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

banner() {
    if [[ -z $1 ]]; then
	echo "Usage <banner text>"
	exit 1
    fi    
    text=" $1 "
    len="$((${#text}+8))"
    line=${(l:len::#:)}
    echo $line
    echo "### ${(U)text} ###"
    echo $line
    
}

writeOutVar() {
    if [[ -r "$2/$1" ]]; then
        vari=$(<"$2/$1")
    else	
	read "vari?Set value for $1: "
    fi
    while read "ans?Use $vari? (y/n)"; do
	case "$ans" in
	    y|yes)
		echo "$vari" > "$2/$1"
		break;
		;;
	    n|no)
		read "vari?Enter new value: "
		;;
	    *)
		echo "Use (y)es/(n)o"
		;;
	esac
    done
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

### Tests

echo "$(pwd)"
writeOutVar "test" "$(pwd)"
