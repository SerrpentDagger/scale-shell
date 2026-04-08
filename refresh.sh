#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

source "$HOME/.local/share/feathers-and-flame/vars.sh"

echo "Refreshing F&F settings..."
source "$FEATHERH/sel-comps.sh" check "Desktop Entries" && source "$FEATHERS/desktops.sh"

tor_file="$HOME/.local/share/applications/start-tor-browser.desktop"
[[ -f "$tor_file" ]] && chmod +x "$tor_file"
