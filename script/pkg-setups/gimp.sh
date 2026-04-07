#!/bin/bash

echo "Setting GIMP theme"
# Get version who's theme file should be changed
version=$(gimp --version | grep -Po "version \K\d\.\d")
[[ -z $version ]] && exit 0

css_file="$HOME/.config/GIMP/$version/theme.css"
if [[ -f "$css_file" ]]; then
	sed -i 's+/themes/Default/gimp.css+/themes/System/gimp.css+g' "$css_file"
fi
