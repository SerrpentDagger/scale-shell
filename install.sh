#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

# Check if the script is being run in Bash
if [[ -z "$BASH_VERSION" ]]; then
	echo "Warning: This script is intended to be run in Bash."
	echo "Please run the script with 'bash install.sh'"
	exit 1
fi

source "$HOME/.local/share/feathers-and-flame/vars.sh"
source "$FEATHERH/show-logo.sh" -header

# Clear tmp
source "$FEATHERH/tmp-clear.sh"

# Select
selection_file="$FEATHER_PATH/selected_install.txt"
if ! [[ -f "$selection_file" ]] || ! gum confirm "(Re)Install previously selected components?"; then
	gum choose "System Packages: Upgrade system and install important packages (RECOMMENDED)" \
		"Auto-login: Setup to skip typing your password twice on boot" \
		"LazyVim: A gorgeous editor" \
		"Mullvad Browser: A reasonably private browser for daily use" \
		"Tor Browser: The anonymous browser" \
		"Vintage Story: Uncompromising survival game (Semi-closed, requires paid account)" \
		"TLP: Advanced power management (RECOMMENDED for laptops)" \
		"Desktop Entries: Set up application menu and hide supurfluous entries" \
		"Alacritty in Nautilus: Set up context menu entry for Nautilus" \
		"Mimetypes: Default applications to open files (RECOMMENDED)" \
		"Configs: Copy config files into place (RECOMMENDED)" \
		--header "Select the desired components to install:" --no-limit --height=15 >"$selection_file"
fi
selection=""
mapfile -t selection < <(grep -Po '^[^:]+(?=:)' "$selection_file")
echo "The following will be installed:"
for selected in "${selection[@]}"; do
	echo "  · $selected"
done
if ! gum confirm "Proceed?"; then
	echo "Cancelled by user."
	exit 1
fi

# Install
for selected in "${selection[@]}"; do
	case "$selected" in
	System*) source "$FEATHERS/packages.sh" ;;
	Auto-login) source "$FEATHERS/autologin.sh" ;;

	LazyVim) source "$FEATHERS/lazyvim.sh" ;;
	Mullvad*) source "$FEATHERS/mullvad.sh" ;;
	Tor*) source "$FEATHERS/mullvad.sh" tor ;;
	Vintage*) source "$FEATHERS/vintagestory.sh" ;;
	TLP) source "$FEATHERS/tlp.sh" ;;

	Desktop*) source "$FEATHERS/desktops.sh" ;;

	Alacritty*) source "$FEATHERS/gnome-terminal.sh" ;;
	Mimetypes) source "$FEATHERS/mimetypes.sh" ;;
	Configs) source "$FEATHERS/configs.sh" ;;
	*) echo "Unrecognised installation instruction $selected! Exiting." ;;
	esac
done

source "$FEATHERH/show-done.sh"
