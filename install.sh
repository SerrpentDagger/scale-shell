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
source "$FEATHERH/sel-comps.sh" generate
source "$FEATHERH/sel-comps.sh" fetch

echo "The following will be installed:"
for selected in "${FI_SELECTION[@]}"; do
	echo "  · $selected"
done
if ! gum confirm "Proceed?"; then
	echo "Cancelled by user."
	exit 1
fi

# Install
for selected in "${FI_SELECTION[@]}"; do
	case "$selected" in
	System*) source "$FEATHERS/packages.sh" ;;
	Auto-login) source "$FEATHERS/autologin.sh" ;;

	LazyVim) source "$FEATHERS/lazyvim.sh" ;;
	Mullvad*) source "$FEATHERS/mullvad.sh" ;;
	Tor*) source "$FEATHERS/mullvad.sh" tor ;;
	Vintage*) source "$FEATHERS/vintagestory.sh" ;;
	TLP) source "$FEATHERS/tlp.sh" ;;

	Desktop*) source "$FEATHERS/desktops.sh" ;;
	Wallpapers) source "$FEATHERS/wallpapers.sh" ;;

	Alacritty*) source "$FEATHERS/gnome-terminal.sh" ;;
	Mimetypes) source "$FEATHERS/mimetypes.sh" ;;
	Configs) source "$FEATHERS/configs.sh" ;;
	*) echo "Unrecognised installation instruction $selected! Exiting." ;;
	esac
done

source "$FEATHERH/show-done.sh"
