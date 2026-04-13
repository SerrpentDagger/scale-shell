#!/bin/bash

echo "Setting localsend theme"
source "$FEATHERH/back-cp.sh" "$FEATHERC/localsend/shared_preferences.json" "$HOME/.local/share/org.localsend.localsend_app/shared_preferences.json"

echo "Allowing access to localsend's ports"
sudo ufw allow 53317/tcp
sudo ufw allow 53317/udp

# Can later remove these access rules by queried ID:
# sudo ufw status numbered
# sudo ufw delete [number]
