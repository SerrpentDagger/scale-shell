#!/bin/bash

source "$HOME/.local/share/feathers-and-flame/vars.sh"
source "$FEATHERH/get-timestamp.sh"

feather_backup="$HOME/Documents/feathers-and-flame-back/user/$FEATHERSTAMP"
mkdir -p "$feather_backup"

cd "$FEATHERC" || exit 1
mv ~/.config/niri "$feather_backup/niri"
mv ~/.config/noctalia "$feather_backup/noctalia"
mv ~/.config/nvim "$feather_backup/nvim"
mv ~/.config/alacritty/alacritty.toml "$feather_backup/alacritty.toml"

cp -R niri ~/.config/niri
cp -R noctalia ~/.config/noctalia
cp -R nvim ~/.config/nvim
cp alacritty/alacritty.toml ~/.config/alacritty/

sed -i "s|/home/serpent|/home/$USER|g" ~/.config/noctalia/settings.json
sed -i "s|/home/serpent|/home/$USER|g" ~/.config/niri/cfg/misc.kdl
sed -i "s|/home/serpent|/home/$USER|g" ~/.config/niri/cfg/keybinds.kdl
sed -i "s|/home/serpent|/home/$USER|g" ~/.config/niri/cfg/hot-rules.kdl
