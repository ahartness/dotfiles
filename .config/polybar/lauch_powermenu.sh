#!/bin/bash

# Customize your lock command and other commands
LOCK_CMD="i3lock -i ~/.config/i3/lockscreen.png" # Replace with your lock command, or just 'i3lock'
LOGOUT_CMD="i3-msg exit"
REBOOT_CMD="systemctl reboot"
SHUTDOWN_CMD="systemctl poweroff"

# Define the menu options. Use newline characters for each option.
OPTIONS="Lock\nLogout\nReboot\nShutdown"

# Use Rofi to display the menu and capture the user's choice.
# -dmenu: Run in dmenu mode (text input/selection).
# -i: Case-insensitive matching.
# -p "Power Menu:": Sets the prompt text.
# -config ~/.config/rofi/config.rasi: (Optional) Path to your Rofi configuration file for custom styling.
#                                    If you don't have one, remove this option.
CHOICE=$(echo -e "$OPTIONS" | rofi -dmenu -i -p "Power Menu:" -config ~/.config/rofi/config.rasi)

case "$CHOICE" in
    "Lock")
        ${LOCK_CMD}
        ;;
    "Logout")
        ${LOGOUT_CMD}
        ;;
    "Reboot")
        ${REBOOT_CMD}
        ;;
    "Shutdown")
        ${SHUTDOWN_CMD}
        ;;
    *)
        # Do nothing if no choice is made or Rofi is closed
        exit 0
        ;;
esac
