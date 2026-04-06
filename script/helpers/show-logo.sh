#!/bin/bash

source "$HOME/.local/share/feathers-and-flame/vars.sh"

ansi_art="$(cat "$FEATHER_PATH/icons/feathers$1.txt")"

clear
echo -e "\n$ansi_art\n"
echo
