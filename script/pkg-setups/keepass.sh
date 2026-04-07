#!/bin/bash

source "$HOME/.local/share/feathers-and-flame/vars.sh"

echo "Setting KeePassXC theme"
target="$HOME/.config/keepassxc/keepassxc.ini"
! [[ -f "$target" ]] && return 0
source "$FEATHERH/backup.sh" "$target"
sed -i "s+^ApplicationTheme=.*$+ApplicationTheme=classic+g" "$target"
