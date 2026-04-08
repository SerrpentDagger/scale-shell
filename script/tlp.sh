#!/bin/bash

source "$HOME/.local/share/feathers-and-flame/vars.sh"

echo "Install tlp power management"
pacman -Q power-profiles-daemon 2>/dev/null && sudo pacman -Run --noconfirm power-profiles-daemon
sudo pacman -S --noconfirm --needed tlp tlp-pd tlp-rdw tlpui || return 1
echo "Enable/mask relevant services"
sudo systemctl enable tlp.service || return 1
sudo systemctl start tlp.service
sudo systemctl mask systemd-rfkill.service
sudo systemctl mask systemd-rfkill.socket
sudo systemctl enable NetworkManager-dispatcher.service
