#!/usr/bin/env bash
source ~/.cache/wal/colors.sh
opacity_hex="30"
background_opacity=$(echo $background)$opacity_hex 
color2=$(echo $color2)$opacity_hex 
color3_accent=$(echo $color3)$opacity_hex 
color1=$(echo $color1)$opacity_hex

read -r -d '' ROFI_CONFIG << EOM
* {
	font: "Mononoki Nerd Font 14";
	bg0: $background_opacity;
	bg1: $color2;
	fg0: $color3;
	fg1: $color0;
	accent-color: $color3_accent;
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
rofi -show drun -theme "$HOME/.config/i3/conf/rofi.rasi" -show-icons -display-drun ""  -dpi 110
