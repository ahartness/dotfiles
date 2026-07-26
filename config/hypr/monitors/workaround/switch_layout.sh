#!/usr/bin/env bash
set -euo pipefail

MONITOR_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/hypr/monitors/workaround"
CURRENT_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/hypr/modules/monitors.lua"

usage() {
    printf 'Usage: %s {single|dual|ultrawide|steamdeck|thinkpad}\n' "${0##*/}" >&2
}

layout="${1:-}"

case "$layout" in
    single|dual|ultrawide|steamdeck|thinkpad)
        SOURCE_CONFIG="$MONITOR_DIR/$layout.lua"
        ;;
    *)
        usage
        exit 2
        ;;
esac

if [[ ! -r "$SOURCE_CONFIG" ]]; then
    printf 'Monitor configuration not found: %s\n' "$SOURCE_CONFIG" >&2
    exit 1
fi

mkdir -p "$(dirname "$CURRENT_CONFIG")"

# Replace the old symlink with a complete regular file in one atomic rename.
# This prevents Hyprland from observing a partially changed config or multiple
# symlink-related filesystem events.
tmp_config="$(mktemp "$(dirname "$CURRENT_CONFIG")/.monitors.lua.XXXXXX")"
trap 'rm -f "$tmp_config"' EXIT

cp -- "$SOURCE_CONFIG" "$tmp_config"
chmod 0644 "$tmp_config"
mv -Tf -- "$tmp_config" "$CURRENT_CONFIG"
trap - EXIT

# Apply exactly one completed config reload.
if ! hyprctl reload; then
    printf 'Hyprland reload failed; active file is %s\n' "$CURRENT_CONFIG" >&2
    exit 1
fi

case "$layout" in
    single)
        # The single config intentionally contains no persistent DP-2 rule.
        # Disable it only after the valid config has finished loading.
        hyprctl keyword monitor "DP-2,disable" >/dev/null
        printf 'Switched to DP-1 only (2560x1440 @ 120 Hz)\n'
        ;;
    dual)
        printf 'Switched to dual monitors: DP-1 + DP-2\n'
        ;;
    ultrawide)
        # The ultrawide config intentionally contains no persistent DP-1 rule.
        hyprctl keyword monitor "DP-1,disable" >/dev/null
        printf 'Switched to DP-2 only (3440x1440 @ 100 Hz)\n'
        ;;
    steamdeck)
        printf 'Switched to Steam Deck layout\n'
        ;;
    thinkpad)
        printf 'Switched to ThinkPad layout\n'
        ;;
esac
