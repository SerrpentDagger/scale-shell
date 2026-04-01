#!/bin/bash

sudo pacman -Syu wlsunset gum fzf yay gnome-calculator imv evince localsend

if ! [[ -e "$FEATHERP/user-selected.packages" ]]; then
	source "$FEATHERS/select-install.sh" sys-extra.packages 'extra system'
	source "$FEATHERS/select-install.sh" media.packages 'media/communications'
	source "$FEATHERS/select-install.sh" aur.packages 'AUR'
fi
source "$FEATHERS/from-file.sh" user-selected.packages
source "$FEATHERS/from-file-aur.sh" user-selected-aur.packages

function pkg_installed() {
	pacman -Q "$1" 2>/dev/null
}
# Run setup scripts based on what was installed
pkg_installed virt-manager && source "$FEATHERPS/virt-manager.sh"
pkg_installed localsend && source "$FEATHERPS/localsend.sh"
