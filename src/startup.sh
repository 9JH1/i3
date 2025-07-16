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
touch ~/.startup_log
$HOME/.config/i3/src/wal.sh > ~/.startup_log


#walltaker 
$HOME/Pictures/Wallpapers/.walltaker/walltaker.sh --id "46554" &

nm-applet &
blueman-applet &
unclutter --timeout 0.5 &
autotiling &
lxqt-policykit-agent & 
xset r rate 200 35 &
