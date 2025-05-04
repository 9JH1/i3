#!/bin/bash

# File to remember toggle state
STATE_FILE="/tmp/i3_floating_toggle_state"

# Determine current state
if [[ -f "$STATE_FILE" && "$(cat "$STATE_FILE")" == "on" ]]; then
    # Turn OFF floating for all windows
    i3-msg -t get_tree | jq '.. | select(.type?) | select(.nodes? or .floating_nodes?) | .nodes? + .floating_nodes? // [] | .[] | select(.window?) | .id' | \
        xargs -I{} i3-msg "[con_id={}] floating disable"

    # Unset rule for new windows
    i3-msg 'for_window [class=".*"] floating disable'
    echo "off" > "$STATE_FILE"
else
    # Turn ON floating for all windows
    i3-msg -t get_tree | jq '.. | select(.type?) | select(.nodes? or .floating_nodes?) | .nodes? + .floating_nodes? // [] | .[] | select(.window?) | .id' | \
        xargs -I{} i3-msg "[con_id={}] floating enable"

    # Set rule for new windows
    i3-msg 'for_window [class=".*"] floating enable'
    echo "on" > "$STATE_FILE"
fi

