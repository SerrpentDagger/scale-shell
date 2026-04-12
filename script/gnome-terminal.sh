#!/bin/bash

echo "Install and setup alacritty terminal in nautilus context menu"
yay -Sua --noconfirm nautilus-open-any-terminal
nautilus -q
sudo glib-compile-schemas /usr/share/glib-2.0/schemas || echo "Warning: Failed to compile glib schemas!"
if gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal alacritty; then
	source "$FEATHERH/sel-comps.sh" --pending remove "Alacritty in Nautilus"
else
	echo "Warning: Failed to set Nautilus terminal to Alacritty!"
fi
