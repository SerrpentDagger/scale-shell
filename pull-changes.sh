#!/bin/bash

source "$HOME/.local/share/feathers-and-flame/vars.sh"
source "$FEATHERH/get-timestamp.sh"

feather_backup="$HOME/Documents/feathers-and-flame-back/$FEATHERSTAMP"
mkdir -p "$feather_backup"

cd "$FEATHERC" || exit
mv niri "$feather_backup/niri"
mv noctalia "$feather_backup/noctalia"
mv nvim "$feather_backup/nvim"
mv alacritty "$feather_backup/alacritty"

cp -R ~/.config/niri niri
cp -R ~/.config/noctalia noctalia
cp -R ~/.config/nvim nvim
cp -R ~/.config/alacritty alacritty
