#!/bin/bash

source "$HOME/.local/share/feathers-and-flame/vars.sh"
if [[ -z "$FEATHERSTATE" ]]; then
	echo "Error: Unset state variable!"
	exit 1
fi

if [[ $# -lt 2 ]]; then
	echo "Usage: bash state.sh <set|unset|clear|check|toggle> NAME"
	exit 1
fi

! [[ -d "${FEATHERSTATE:?}" ]] && mkdir -p "$FEATHERSTATE"

if [[ $1 == "set" ]]; then
	touch "$FEATHERSTATE/$2"
elif [[ $1 == "unset" ]]; then
	rm "$FEATHERSTATE/$2"
elif [[ $1 == "clear" ]]; then
	rm "$FEATHERSTATE/$2"*
	# [[ -d "$FEATHERSTATE/$2" ]] && rm -r "${FEATHERSTATE:?}/$2"
elif [[ $1 == "check" ]]; then
	[[ -f "$FEATHERSTATE/$2" ]] && return 0
	return 1
elif [[ $1 == "toggle" ]]; then
	to_state=""
	if [[ -f "$FEATHERSTATE/$2" ]]; then
		rm "$FEATHERSTATE/$2"
		to_state="Inactive"
	else
		touch "$FEATHERSTATE/$2"
		to_state="Active"
	fi
	if [[ $3 == "--notify" ]]; then
		notify-send "State Toggled" "Feather state '$2' has been toggled to '$to_state.'"
	fi
fi
return 0
