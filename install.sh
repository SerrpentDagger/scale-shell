#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

export SCALE_PATH="$HOME/.local/share/scale-shell"
export SCALES="$SCALE_PATH/script"
export SCALEH="$SCALES/helpers"
export SCALET="$SCALEH/tmp"

# Clear tmp
source "$SCALEH/tmp-clear.sh"

# Install
source "$SCALES/mullvad.sh"
