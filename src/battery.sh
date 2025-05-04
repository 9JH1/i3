#!/bin/bash

# Get battery information using upower
BATTERY=$(upower -i $(upower -e | grep BAT) | grep -E 'percentage' | awk '{print $2}' | sed 's/%//')
STATUS=$(upower -i $(upower -e | grep BAT) | grep -E 'state' | awk '{print $2}')
icon="%{T3}"
# Define icon mapping
if [ "$STATUS" = "charging" ]; then
    icon="$icon󰂄 "  # Charging icon
elif [ "$BATTERY" -eq 100 ]; then
    icon="$icon󱟢"  # Fully charged icon
elif [ "$BATTERY" -le 25 ]; then
    icon="$icon "  # 0-10%
elif [ "$BATTERY" -le 50 ]; then
    icon="$icon "  # 11-20%
elif [ "$BATTERY" -le 75 ]; then
    icon="$icon "  # 21-30%
elif [ "$BATTERY" -le 100 ]; then
    icon="$icon "  # 51-60%
else
    icon="$icon "  # 61-100%
fi
icon="$icon %{T-}"
echo $icon
