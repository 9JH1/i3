#!/bin/bash
source ~/.cache/wal/colors.sh 
bg_op=100
read -r -d '' JGMENU_CONFIG << EOM 
stay_alive = 0
position_mode = pointer 
color_menu_bg = $color2 $bg_op
color_menu_bg_to = $color2 $bg_op
color_norm_bg = $color2 $bg_op
color_norm_fg = $background $bg_op
color_sel_bg = $color3 $bg_op
color_sel_fg = $background $bg_op
font = Mononoki Nerd Font Bold
icon_size=0
EOM

read -r -d '' JGMENU_CSV << EOM 
  Lock,~/.config/i3/src/lock.sh,
󰒲  Suspend,systemctl -i suspend,
  Restart,systemctl -i reboot,
󱪰  Smart Lock,~/.config/i3/src/lock.sh --image,
󰦝  Smarter Lock,~/.config/i3/src/lock.sh --suspend,
󰐥  Shutdown,systemctl -i poweroff,
󰸉  Wallpaper,~/.config/i3/src/wal.sh --exclude-hidden,

EOM

jgmenu --config-file=<(echo "$JGMENU_CONFIG") --csv-file=<(echo "$JGMENU_CSV")
