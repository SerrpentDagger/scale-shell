#!/bin/bash

source "$HOME/.local/share/feathers-and-flame/vars.sh"
sudo pacman -Syu --noconfirm wlsunset fzf yay gnome-calculator imv mpv evince localsend

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

##### Run setup scripts based on what was installed
pkg_installed virt-manager && source "$FEATHERPS/virt-manager.sh"
pkg_installed localsend && source "$FEATHERPS/localsend.sh"

# imv background
pkg_installed imv && sudo sed -i "s/Exec=imv %F/Exec=imv -b checks %F/g" /usr/share/applications/imv.desktop || true

# KeePassXC theme
pkg_installed keepassxc && source "$FEATHERPS/keepass.sh"

# Gimp theme (I actually prefer plain dark theme here.)
# pkg_installed gimp && source "$FEATHERPS/gimp.sh"

# Krita theme (I actually prefer plain dark theme here.)
# pkg_installed krita && source "$FEATHERPS/krita.sh"
