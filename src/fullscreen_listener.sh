#!/bin/bash 
# wrapper for fullscreen_listener.sh
kill $(cat ~/.i3listenerpid)
python "$HOME/.config/i3/src/fullscreen_listener.py"
echo $! > "~/.i3listnerpid" 
