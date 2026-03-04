#!/bin/bash

if gum confirm "Install VintageStory? (Semi-closed, requires paid account, flatpak)"; then
	sudo pacman -S flatpak
	flatpak --user install https://flatpak.vintagestory.at/VintageStory.flatpakref
	cp "$SCALEA/vintagestory.desktop" "$HOME/.local/share/applications/"
fi
