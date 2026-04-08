#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

source "$HOME/.local/share/feathers-and-flame/vars.sh"
source "$FEATHERH/show-logo.sh" -header

if gum confirm "Full system update first? (Recommended)"; then
	sudo pacman -Syu
fi

# Update scripts and local config reference
cd "$FEATHER_PATH"
git pull

# Check for config changes, query for update if so
source "$FEATHERH/tmp-spawn.sh"
source "$FEATHER_PATH/pull-changes.sh" --for-diff
if ! diff -r --color --label="CURRENT" --label="NEW" "$FEATHERT/config" "$FEATHERC"; then
	gum confirm "Update configs in-place? (Backups created in Documents/) Otherwise you can just copy them from the ./config directory here." && bash "$FEATHERS/configs.sh"
fi
source "$FEATHERH/tmp-clear.sh"

source "$FEATHERH/show-done.sh"
