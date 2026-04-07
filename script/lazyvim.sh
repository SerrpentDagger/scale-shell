#!/bin/bash

# npm cargo R
sudo pacman -S --noconfirm --needed npm lazygit ripgrep fd neovim

source "$HOME/.local/share/feathers-and-flame/vars.sh"

source "$FEATHERH/backup.sh" -m ~/.local/share/nvim
source "$FEATHERH/backup.sh" -m ~/.local/state/nvim
source "$FEATHERH/backup.sh" -m ~/.cache/nvim
source "$FEATHERH/back-cp.sh" "$FEATHERC/nvim" ~/.config/nvim

source "$FEATHERPS/lazyvim.sh"
