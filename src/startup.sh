#!/bin/bash
killall alttab
killall snixembed
killall picom
killall plank
killall dunst 
killall nm-applet
killall blueman-applet
killall polybar
killall unclutter
killall polydock
killall conky

CONFIG="$HOME/.config/i3/conf/alacritty-padding.toml"

xrdb -merge ~/.Xresources & 
/home/$USER/.config/i3/src/background.sh &

snixembed &
alttab -d 1 -t 100x50 -i 50x50 -b 1 -bw 5 -s 2 -font xft:MononokiNerdFont-50 &
picom -b --config "/home/$USER/.config/i3/conf/picom.conf" &
plank &
nm-applet & 
blueman-applet &
unclutter --timeout 0.5 &
echo '[window.padding]' > "$CONFIG" &
echo 'y=40' >> "$CONFIG"
echo 'x=40' >> "$CONFIG"
polybar -c "/home/$USER/.config/i3/conf/polybar.ini" bar_main & 
conky --config "$HOME/.config/i3/conf/conky.conf" &
"$HOME/.config/i3/src/dunst.sh"
