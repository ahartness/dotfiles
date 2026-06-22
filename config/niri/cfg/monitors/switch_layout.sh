#!/bin/bash

# ────────────── Output Configuration ──────────────
# You can run `niri msg outputs` to get the correct name for your displays.
# You will have to remove "/-" and edit it before it takes effect.
# https://github.com/YaLTeR/niri/wiki/Configuration:-Outputs

# Define directory paths
MONITOR_DIR="$HOME/.config/niri/cfg/monitors"
CURRENT_CONFIG="$HOME/.config/niri/cfg/display.kdl"

SOURCE_CONFIG=""

if [ "$1" == "single" ]; then
    SOURCE_CONFIG="$MONITOR_DIR/single.kdl"
    notify-send "Monitor Switcher" "Switched to Single Monitor (DP-1 @ 165Hz)"
elif [ "$1" == "dual" ]; then
    SOURCE_CONFIG="$MONITOR_DIR/dual.kdl"
    notify-send "Monitor Switcher" "Switched to Dual Monitor (Stack)"
elif [ "$1" == "ultrawide" ]; then
    SOURCE_CONFIG="$MONITOR_DIR/ultrawide.kdl"
    notify-send "Monitor Switcher" "Switched to UltraWide Monitor (DP-2 @ 144Hz)"
elif [ "$1" == "steamdeck" ]; then
    SOURCE_CONFIG="$MONITOR_DIR/steamdeck.kdl"
    notify-send "Monitor Switcher" "Switched to Steam Deck (DP-2 1280x800@60Hz)"
else
    notify-send "Monitor Switcher Failed" "Usage: ./switch_layout.sh [single|dual|ultrawide|steamdeck]"
    exit 1
fi

if [ ! -f "$SOURCE_CONFIG" ]; then
    notify-send "Monitor Switcher Failed" "Preset file not found: $SOURCE_CONFIG"
    exit 1
fi

# Niri does not support symlinked configs, so write real file contents.
# Remove a stale symlink so we can create a real file in its place.
if [ -L "$CURRENT_CONFIG" ]; then
    rm -f "$CURRENT_CONFIG"
fi

cp -f "$SOURCE_CONFIG" "$CURRENT_CONFIG"

# 1. Trigger Niri to reload the config file
niri validate 