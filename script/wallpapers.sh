#!/bin/bash

source "$HOME/.local/share/feathers-and-flame/vars.sh"

wall_file="$FEATHERX/wallpapers.txt"
trap 'source "$FEATHERH/tmp-clear.sh"' EXIT
source "$FEATHERH/tmp-spawn.sh"

while IFS= read -r line || [[ -n "$line" ]]; do
	read -r NAME URL EXP_SHA <<<"$line"

	if [[ -z "$NAME" || -z "$URL" || -z "$EXP_SHA" ]]; then
		echo "Skipping malformed wallpaper line: $line" >&2
		continue
	fi

	target="$FEATHERT/$NAME"
	echo "Downloading $URL to $target"
	if ! curl -fsSL "$URL" -o "$target"; then
		echo "Download failed for $URL" >&2
		continue
	fi

	targets_sha="$(sha256sum "$target" | awk '{print $1}')"
	if [[ "$targets_sha" == "$EXP_SHA" ]]; then
		echo "Success: $NAME"
		source "$FEATHERH/back-cp.sh" "$target" "$FEATHER_PATH/$NAME"
	else
		echo "SHA MISMATCH for $NAME:"
		echo "  Expected: $EXP_SHA"
		echo "  Actual  : $targets_sha"
		rm -f "$target"
	fi
done <"$wall_file"
