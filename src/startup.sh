#!/bin/bash
killall alttab
killall snixembed
killall picom
killall dunst 
killall nm-applet
killall blueman-applet
killall polybar
killall unclutter
killall autotiling
killall plank 
killall conky 

mod=""
"$HOME/.config/i3/src/screen.sh" &
xrdb -merge ~/.Xresources & 
/home/$USER/.config/i3/src/background.sh > /home/$USER/.config/i3/background_log.txt
"$HOME/.config/i3/src/dunst.sh" & 
snixembed &
alttab -d 1 -t 100x50 -i 50x50 -b 1 -bw 5 -s 2 -font xft:MononokiNerdFont-50 &
picom -b --config "/home/$USER/.config/i3/conf/picom.conf" &
nm-applet & 
blueman-applet &
unclutter --timeout 0.5 &
autotiling &
polybar -c "/home/$USER/.config/i3/conf/polybar$mod.ini" bar_main & 

if [ "$mod" = "-laptop" ]; then
	plank & 
	conky &
fi
