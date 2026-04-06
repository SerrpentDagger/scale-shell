#!/bin/bash

source "$HOME/.local/share/feathers-and-flame/vars.sh"
subdir="."
if [[ "--for-diff" = "$1" ]]; then
	subdir="$FEATHERT/config"
fi

cd "$FEATHERC" || exit 1
source "$FEATHERH/back-cp.sh" ~/.config/niri "$subdir/niri"
source "$FEATHERH/back-cp.sh" ~/.config/noctalia "$subdir/noctalia"
source "$FEATHERH/back-cp.sh" ~/.config/nvim "$subdir/nvim"
source "$FEATHERH/back-cp.sh" ~/.config/alacritty "$subdir/alacritty"
source "$FEATHERH/back-cp.sh" ~/.config/qt5ct/qt5ct.conf "$subdir/qt/qt5ct.conf"
source "$FEATHERH/back-cp.sh" ~/.config/qt6ct/qt6ct.conf "$subdir/qt/qt6ct.conf"
