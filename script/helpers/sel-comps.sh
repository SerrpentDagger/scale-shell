#!/bin/bash

source "$HOME/.local/share/feathers-and-flame/vars.sh"
selection_file="$FEATHER_PATH/selected_install.txt"

if [[ "generate" == "$1" ]]; then
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
elif [[ "fetch" == "$1" ]]; then
	if ! [[ -f "$selection_file" ]]; then
		echo "Error: Missing component selection file!"
		return 1
	fi
	if [[ -z "${FI_SELECTION:-}" ]]; then
		FI_SELECTION=""
		mapfile -t FI_SELECTION < <(grep -Po '^[^:]+(?=:)' "$selection_file")
		export FI_SELECTION
	fi
elif [[ "check" == "$1" ]]; then
	source "$FEATHERH/sel-comps.sh" fetch
	for sel in "${FI_SELECTION[@]}"; do
		[[ "$sel" == "$2" ]] && return 0
	done
	return 1
else
	echo "Usage: $0 <generate|fetch|check>"
	return 1
fi
