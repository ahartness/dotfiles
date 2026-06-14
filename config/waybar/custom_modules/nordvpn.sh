#!/bin/bash

# Get status from nordvpn
status=$(nordvpn status | grep "Status" | cut -d ':' -f2 | xargs)

CONNECTED_COLOR="#50fa7b"
DISCONNECTED_COLOR="#bf616a"

if [ "$status" = "Connected" ]; then
  city=$(nordvpn status | grep "City" | cut -d ':' -f2 | xargs)
  transfer=$(nordvpn status | grep "Transfer" | cut -d ':' -f2 | xargs)

  #Output for Json for waybar
  echo "{\"text\": \" | <span color='$CONNECTED_COLOR'> ⏻  VPN Connected</span>: $city, $transfer\", \"class\": \"connected\", \"tooltip\": \"$status\"}"
else
  echo "{\"text\": \" | <span color='$DISCONNECTED_COLOR'> ⏻  VPN Disconnected</span>\", \"class\": \"disconnected\", \"tooltip\": \"$status\"}"
fi
