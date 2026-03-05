#!/bin/bash

al_file="/etc/sddm.conf.d/autologin.conf"

# Make sure dir exists
sudo mkdir -p /etc/sddm.conf.d

# Backup/move existing conf file
source "$SCALEH/get-timestamp.sh"
[[ -e "$al_file" ]] && sudo mv "$al_file" "$al_file.bak.$SCALESTAMP"

# Copy ours in and set proper username
sudo cp "$SCALC/sddm/autologin.conf" "$al_file"
sudo sed -i "s/User=serpent/User=$USER/g" "$al_file"
