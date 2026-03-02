#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

source "$HOME/.local/share/scale-shell/vars.sh"

# Clear tmp
source "$SCALEH/tmp-clear.sh"

# Install
source "$SCALES/autologin.sh"
source "$SCALES/mullvad.sh"
