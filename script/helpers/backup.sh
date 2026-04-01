#!/bin/bash

move_file=0
if [[ "--move" == "$1" ]] || [[ "-m" == "$1" ]]; then
	move_file=1
	shift
fi
if ! [[ -e "$1" ]]; then
	exit 0
fi
target="$1"

source "$HOME/.local/share/feathers-and-flame/vars.sh"
source "$FEATHERH/get-timestamp.sh"

feather_backup="$HOME/Documents/feathers-and-flame-back/$FEATHERSTAMP"
dest="$feather_backup$target"
mkdir -p "$(dirname "$dest")"
if [[ "$move_file" -eq 1 ]]; then
	mv "$target" "$dest"
else
	cp "$target" "$dest"
fi
