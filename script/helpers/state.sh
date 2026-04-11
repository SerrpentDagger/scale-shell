#!/bin/bash

source "$HOME/.local/share/feathers-and-flame/vars.sh"
if [[ -z "$FEATHERSTATE" ]]; then
	echo "Error: Unset state variable!"
	exit 1
fi

if [[ $# -lt 2 ]]; then
	echo "Usage: bash state.sh <set|clear|check> NAME"
	exit 1
fi

! [[ -d "${FEATHERSTATE:?}" ]] && mkdir -p "$FEATHERSTATE"

if [[ $1 == "set" ]]; then
	touch "$FEATHERSTATE/$2"
elif [[ $1 == "clear" ]]; then
	[[ -f "$FEATHERSTATE/$2" ]] && rm "$FEATHERSTATE/$2"
	# [[ -d "$FEATHERSTATE/$2" ]] && rm -r "${FEATHERSTATE:?}/$2"
elif [[ $1 == "check" ]]; then
	[[ -f "$FEATHERSTATE" ]] && return 0
	return 1
fi
return 0
