#!/bin/bash

killall alttab
killall snixembed
killall picom
killall plank
killall dunst 
killall nm-applet
killall blueman-applet
killall polybar

xrdb -merge ~/.Xresources & 
/home/$USER/.config/i3/src/background.sh &


alttab -d 1 -t 100x50 -i 50x50 -b 1 -bg "#000000" -fg "#00ff00" -bc "#00ff00" -bw 5 -s 2 -font xft:hack-50 &
picom -b --config "/home/$USER/.config/i3/conf/picom.conf" &
dunst &
plank &
nm-applet & 
blueman-applet & 

polybar -c "/home/$USER/.config/i3/conf/polybar.ini" bar_main & 

