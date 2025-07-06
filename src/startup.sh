#!/bin/bash
killall snixembed
killall picom
killall nm-applet
killall blueman-applet
killall unclutter
killall autotiling
killall lxqt-policykit-agent
killall plank

"$HOME/.config/i3/src/screen.sh" &
$HOME/.config/i3/src/wal.sh


#walltaker 
$HOME/Pictures/Wallpapers/.walltaker/walltaker.sh --id "46554" &

picom --config "$HOME/.config/i3/conf/picom.conf" --experimental-backends &
snixembed &
#picom -b --config "$HOME/.config/i3/conf/picom.conf" &
nm-applet &
blueman-applet &
unclutter --timeout 0.5 &
autotiling &
lxqt-policykit-agent & 
plank & 
xset r rate 200 35 &
