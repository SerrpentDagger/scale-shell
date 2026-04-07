#!/bin/bash

source "$HOME/.local/share/feathers-and-flame/vars.sh"

echo "Setting Krita theme"
target="$HOME/.config/kritarc"
source "$FEATHERH/backup.sh" "$target"
sed -i "s+^Theme=.*$+Theme=noctalia+g" "$target"
