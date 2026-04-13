#!/bin/bash

# Exit early if no cbonsai
if ! command -v cbonsai &>/dev/null; then
	exit 1
fi

exit_screensaver() {
	pkill -x cbonsai 2>/dev/null
	pkill -f com.serpentdagger.screensaver 2>/dev/null
	exit 0
}

if [[ "kill" = "$1" ]]; then
	exit_screensaver
fi

# Only need one screensaver at a time.
if pgrep -x cbonsai &>/dev/null; then
	exit 0
fi

source "$HOME/.local/share/feathers-and-flame/vars.sh"
niri_output_pattern='^Output.*\(\K[^\)]+'
focused_output() {
	niri msg focused-output | grep -oP "$niri_output_pattern"
}
focused=$(focused_output)

bonsai_blurb="$(shuf -n 1 -- "$FEATHERX/bonsai-blurbs.txt")"
bonsai_blurb="${bonsai_blurb//traveler/$USER}"
echo "$bonsai_blurb" | grep -v 'Feathers and Flame' | grep -v "\\." && bonsai_blurb="$bonsai_blurb"...

outputword="outputs"
if [[ "--current" = "$1" ]]; then
	outputword="focused-output"
fi

screensaver_in_focus() {
	if ! niri msg focused-window | grep -P "\w*App ID.*com\.serpentdagger\.screensaver" >/dev/null 2>&1; then
		[[ "$focused" != "$(focused_output)" ]] && [[ "$outputword" = "focused-output" ]]
	fi
}

get_monitors() {
	niri msg $outputword | grep -B 1 "Current mode" | grep -oP "$niri_output_pattern"
}

focus_monitor() {
	niri msg action focus-monitor "$1"
}

# Exit the screensaver on signals and input from keyboard and mouse
trap exit_screensaver SIGINT SIGTERM SIGHUP SIGQUIT

for m in $(get_monitors); do
	focus_monitor "$m"

	alacritty --class=com.serpentdagger.screensaver -e cbonsai --life 90 --multiplier 11 --message="$bonsai_blurb" --leaf="@,0,O,8" --screensaver &
	sleep 0.3
done
sleep 0.5

while pgrep -x cbonsai >/dev/null; do
	if ! screensaver_in_focus; then
		exit_screensaver
	fi
	sleep 0.2
done

focus_monitor "$focused"
