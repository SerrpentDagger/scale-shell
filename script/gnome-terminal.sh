#!/bin/bash

echo "Install and setup alacritty terminal in nautilus context menu"
yay -Sua --noconfirm nautilus-open-any-terminal
nautilus -q
sudo glib-compile-schemas /usr/share/glib-2.0/schemas || echo "Warning: Failed to compile glib schemas!"
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal alacritty || echo "Warning: Failed to set Nautilus terminal to Alacritty!"
