#!/bin/bash

source "$HOME/.local/share/feathers-and-flame/vars.sh"
source "$FEATHERH/get-timestamp.sh"

feather_backup="$HOME/Documents/feathers-and-flame-back/user/$FEATHERSTAMP"
mkdir -p "$feather_backup"

al_file="/etc/sddm.conf.d/autologin.conf"

# Make sure dir exists
sudo mkdir -p /etc/sddm.conf.d

# Backup/move existing conf file
[[ -e "$al_file" ]] && sudo mv "$al_file" "$feather_backup/" || true

# Copy ours in and set proper username
sudo cp "$SCALC/sddm/autologin.conf" "$al_file"
sudo sed -i "s/User=serpent/User=$USER/g" "$al_file"
