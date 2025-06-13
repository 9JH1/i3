#!/bin/bash 
source ~/.cache/wal/colors.sh
opacity="45"
background=$color0
background_transparent="#$opacity${background:1}"

read -r -d '' POLYBAR_CONFIG << EOM
[bar/bar_bottom]
bottom =  true 
modules-center = space 
background=$background_transparent
border-color = $color4
border-left-size = 2pt 
border-bottom-size = 2pt 
border-top-size = 2pt
override-redirect = true
wm-restack = i3
border-right-size  = 2pt 
height = 3.2%
dpi=100

[module/space]
type = custom/text
content = " "
EOM

POLYBAR_CONFIG_PATH="$HOME/.config/i3/conf/polybar_dock.ini"
echo "$POLYBAR_CONFIG" > "$POLYBAR_CONFIG_PATH"
polybar -c "$POLYBAR_CONFIG_PATH" &
echo $! > ~/.i3polybar_dock_pid
