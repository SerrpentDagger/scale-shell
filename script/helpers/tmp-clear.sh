#!/bin/bash

source "$HOME/.local/share/feathers-and-flame/vars.sh"

if [[ -z "$FEATHERT" ]]; then
	echo "FEATHERT is not set!"
	exit 1
fi
rm -rf "$FEATHERT"
