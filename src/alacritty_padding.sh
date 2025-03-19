#!/bin/bash
CONFIG="$HOME/.config/i3/conf/alacritty-padding.toml"

if grep -q "y=40" "$CONFIG"; then
    echo '[window.padding]' > "$CONFIG"
    echo 'y=0' >> "$CONFIG"
    echo 'x=0' >> "$CONFIG"
else
    echo '[window.padding]' > "$CONFIG"
    echo 'y=40' >> "$CONFIG"
    echo 'x=40' >> "$CONFIG"
fi
