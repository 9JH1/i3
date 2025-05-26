#!/usr/bin/env bash
source ~/.cache/wal/colors.sh
read -r -d '' ROFI_CONFIG << EOM
* {
	font: "Mononoki Nerd Font 13";
	bg0: $background;
	bg1: $color2;
	fg0: $color3;
	fg1: $color0;
	accent-color: $color3;
	urgent-color: $color1;
	background-color: transparent;
	text-color: @fg0;

	margin: 0;
	padding:0;
	spacing:0;
}
EOM
ROFI_PATH="/home/$USER/.config/i3/conf/rofi-colors.rasi"
echo "$ROFI_CONFIG" > "$ROFI_PATH"
rofi -show drun -theme "$HOME/.config/i3/conf/rofi.rasi" -show-icons
