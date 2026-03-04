#!/usr/bin/env bash

result=$(dig +short +timeout=2 +tries=1 @192.168.0.3 amiserv.amicon.lan 2>/dev/null)

if echo "$result" | grep -qx '192\.168\.0\.1'; then
    ~/.config/waybar/scripts/vpn_disconnect.sh
else
    ~/.config/waybar/scripts/vpn_connect.sh
fi
