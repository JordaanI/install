#!/bin/sh

install=$(pwd)

. "$install/utils.sh"


banner "create username"

writeOutVar "user" "$install"

banner "set password"

writeOutVar "password" "$install"

banner "hold onto your butts"
