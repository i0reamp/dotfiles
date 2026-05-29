#!/usr/bin/env bash
# Turn off displays unless any media player is currently Playing.
if playerctl -a status 2>/dev/null | grep -qx "Playing"; then
    exit 0
fi
exec swaymsg "output * dpms off"
