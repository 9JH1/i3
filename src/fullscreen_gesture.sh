#!/bin/bash

THRESHOLD=10
MODIFIER=Mod4  # Adjust to your floating_modifier

while true; do
    # Check if modifier is held (requires xinput or similar tool)
    # Simplified: Assume dragging if mouse is moving
    eval $(xdotool getmouselocation --shell)
    if [ "$Y" -lt "$THRESHOLD" ]; then
        i3-msg "fullscreen enable"
        sleep 1  # Avoid spamming commands
    fi
    sleep 0.1  # Adjust polling rate
done
