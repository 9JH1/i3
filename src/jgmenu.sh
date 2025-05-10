#!/bin/bash
source ~/.cache/wal/colors.sh 
read -r -d '' JGMENU_CONFIG << EOM 
stay_alive = 0
position_mode = pointer 
color_menu_bg = $color4 100
color_menu_bg_to = $color4  100
color_norm_bg = $color4 100
color_norm_fg = $background 100
color_sel_bg = $color6 100
color_sel_fg = $background 100
font = Mononoki Nerd Font Bold
icon_size=0
EOM

read -r -d '' JGMENU_CSV << EOM 
 Lock,~/.config/i3/src/lock.sh,
󰒲 Suspend,systemctl -i suspend,
 Reboot,systemctl -i reboot,
󰐥 Poweroff,systemctl -i poweroff,
EOM

jgmenu --config-file=<(echo "$JGMENU_CONFIG") --csv-file=<(echo "$JGMENU_CSV")
