#!/bin/bash

cities=(
  "Charlotte"
  "Nashville"
  "Miami"
  "Atlanta"
  "Pittsburgh"
  "New_York"
)

random_city="${cities[$RANDOM % ${#cities[@]}]}"

# notify-send "NordVPN" "Connecting to $random_city..." 2>/dev/null

nordvpn connect "$random_city"
