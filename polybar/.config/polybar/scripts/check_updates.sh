#!/bin/bash

if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
    updates_arch=0
fi

if ! updates_aur=$(yay -Qum 2> /dev/null | wc -l); then
    updates_aur=0
fi

updates=$(("$updates_arch" + "$updates_aur"))

if [[ "$updates" -gt 4 ]]; then
    echo "$updates_arch  $updates_aur"
else
    # System is up to date. :>
    # If string is empty, no module is shown at all,
    # so it only appears if you have an update available
    echo ""
fi
