#!/bin/bash

# Define paths
MONITOR_DIR="$HOME/.config/hypr/monitors"
CURRENT_CONFIG="$HOME/.config/hypr/modules/monitor.lua"

if [ "$1" == "single" ]; then
    ln -sf "$MONITOR_DIR/single.lua" "$CURRENT_CONFIG"
    echo "Switched to Single Monitor (DP-1 @ 180Hz)"
elif [ "$1" == "dual" ]; then
    ln -sf "$MONITOR_DIR/dual.lua" "$CURRENT_CONFIG"
    echo "Switched to Dual Monitor (Stack)"
elif [ "$1" == "ultrawide" ]; then
    ln -sf "$MONITOR_DIR/ultrawide.lua" "$CURRENT_CONFIG"
    echo "Switched to UltraWide Monitor (DP-2 @ 144Hz)"
elif [ "$1" == "steamdeck" ]; then
    ln -sf "$MONITOR_DIR/steamdeck.lua" "$CURRENT_CONFIG"
    echo "Switched to Steam Deck (DP-2 1280x800@60Hz)"
elif [ "$1" == "thinkpad" ]; then
    ln -sf "$MONITOR_DIR/thinkpad.lua" "$CURRENT_CONFIG"
    echo "Switched to ThinkPad (eDP-1 1920x1080@60Hz)"
else
    echo "Usage: ./switch_layout.sh [single|dual|ultrawide|steamdeck|thinkpad]"
    exit 1
fi

# 1. Trigger Hyprland to reload the config file
hyprctl reload

# 2. Force window movement (optional but recommended)
# This moves all windows to workspace 1 so they don't get lost on a disabled screen
window_addresses=$(hyprctl clients -j | jq -r '.[].address')
for addr in $window_addresses; do
    hyprctl dispatch movetoworkspace 1,address:$addr
done
