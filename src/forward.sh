#!/bin/bash

# Get current playback position
position=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Position | awk '{print $2}' | awk -F '.' '{print $1}')

# Skip forward 5 seconds (50000000 microseconds)
new_position=$((position + 5))

# Set new playback position
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Seek int64:$((new_position * 1000000))

