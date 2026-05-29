#!/usr/bin/env bash
# Lock screen unless any media player is currently Playing.
if playerctl -a status 2>/dev/null | grep -qx "Playing"; then
    exit 0
fi
swaymsg "input type:keyboard xkb_switch_layout 0"
exec swaylock -f -c 000000
