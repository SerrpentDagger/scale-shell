#!/bin/bash

yay -S nautilus-open-any-terminal
nautilus -q
sudo glib-compile-schemas /usr/share/glib-2.0/schemas
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal alacritty
