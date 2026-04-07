#!/bin/bash

set -eEo pipefail
ansi_art=' == Feathers and Flame ==

         ▓█
      ██   ▓███▓  ███
    ▓███████████████   █▓
   ▓████▓▓   ▓▓████▓
   ███           ██
   ██   █▓   █▓  ███ ▓█
   ███           ██▓
    ████      ▓███████▓
   ██▓ ▓       ▓██████
   ██             ███▓
   ███   ██       ███
    ██▓  ██▓      ▓██
     ███▓████      ██
       ▓█████████▓███
               ▓▓▓██▓

    Welcome, traveller.

=========================='

clear
echo -e "\n$ansi_art\n"
echo "Preparing to install..."
sudo pacman -Syu --noconfirm --needed git gum

# Use custom branch if instructed, otherwise default to master
FEATHERS_REF="${FEATHERS_REF:-master}"
# Use custom repo if specified, otherwise default to basecamp/omarchy
FEATHERS_REPO="${FEATHERS_REPO:-SerrpentDagger/feathers-and-flame}"

echo -e "\nCloning Feathers and Flame from: https://github.com/${FEATHERS_REPO}.git"
rm -rf ~/.local/share/feathers-and-flame/
git clone "https://github.com/${FEATHERS_REPO}.git" ~/.local/share/feathers-and-flame >/dev/null

echo -e "\e[32mUsing branch: $FEATHERS_REF\e[0m"
cd ~/.local/share/feathers-and-flame || exit 1
git fetch origin "${FEATHERS_REF}" && git checkout "${FEATHERS_REF}"

echo -e "\nInstallation starting..."
source ~/.local/share/feathers-and-flame/install.sh
