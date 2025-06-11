#!/bin/bash
killall snixembed
killall picom
killall nm-applet
killall blueman-applet
killall unclutter
killall autotiling
killall lxqt-policykit-agent
killall plank & 

"$HOME/.config/i3/src/screen.sh" &
/home/$USER/.config/i3/src/wal.sh
snixembed &
picom -b --config "/home/$USER/.config/i3/conf/picom.conf" &
nm-applet &
blueman-applet &
unclutter --timeout 0.5 &
autotiling &
lxqt-policykit-agent & 
plank & 


