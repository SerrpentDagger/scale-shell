#!/bin/bash

# Download archive into tmp
source "$SCALEH/tmp-spawn.sh"
wget --trust-server-names https://mullvad.net/en/download/browser/linux-x86_64/latest -P "$SCALET"

# Clear current install
rm -rf ~/.local/share/mullvad-browser
rm -f ~/.local/share/applications/start-mullvad-browser.desktop

# Extract into own share folder
cd ~/.local/share
tar -xvf $SCALET/mullvad-browser-linux-x86_64-*.tar.xz
cd ~/.local/share/mullvad-browser
# Have it make a broken .desktop for itself in applications folder
./start-mullvad-browser.desktop --register-app
# Fix said broken .desktop
sed -i "s|./Browser|$HOME/.local/share/mullvad-browser/Browser|g" ~/.local/share/applications/start-mullvad-browser.desktop

# Remove archive download
source "$SCALEH/tmp-clear.sh"
