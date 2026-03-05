#!/bin/bash

source "$HOME/.local/share/scale-shell/vars.sh"
source "$SCALEH/get-timestamp.sh"

scale_backup="$HOME/Documents/scale-shell-back/user/$SCALESTAMP"
mkdir -p "$scale_backup"

cd "$SCALEC" || exit
mv ~/.config/niri "$scale_backup/niri"
mv ~/.config/noctalia "$scale_backup/noctalia"
mv ~/.config/nvim "$scale_backup/nvim"

cp -R niri ~/.config/niri
cp -R noctalia ~/.config/noctalia
cp -R nvim ~/.config/nvim
