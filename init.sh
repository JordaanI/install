#!/bin/env zsh

install=$(pwd)

. "$install/utils.sh"

echo ""

banner "create username"

echo ""

writeOutVar "user" "$install"

echo ""

banner "set password"

echo ""

writeOutVar "password" "$install"

echo ""

banner "hold onto your butts"

echo ""
