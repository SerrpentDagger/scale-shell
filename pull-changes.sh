#!/bin/bash

source "$HOME/.local/share/feathers-and-flame/vars.sh"
subdir="."
for_diff=0
if [[ "--for-diff" = "$1" ]]; then
	subdir="$FEATHERT/config"
	for_diff=1
fi

cd "$FEATHERC" || exit 1
source "$FEATHERH/back-cp.sh" ~/.config/niri "$subdir/niri"
source "$FEATHERH/back-cp.sh" ~/.config/noctalia "$subdir/noctalia"
source "$FEATHERH/back-cp.sh" ~/.config/nvim "$subdir/nvim"
source "$FEATHERH/back-cp.sh" ~/.config/alacritty "$subdir/alacritty"
source "$FEATHERH/back-cp.sh" ~/.config/qt5ct/qt5ct.conf "$subdir/qt/qt5ct.conf"
source "$FEATHERH/back-cp.sh" ~/.config/qt6ct/qt6ct.conf "$subdir/qt/qt6ct.conf"

if [[ "$for_diff" -eq 1 ]]; then
	rm "$subdir/noctalia/colors.json"
	rm "$subdir/niri/noctalia.kdl"
	rm "$subdir/nvim/lua/matugen.lua"
fi
