#!/usr/bin/env bash
VPN_NAME=${VPN_NAME:-vdsina}

if nmcli -t -f TYPE,NAME con show --active | grep -q "wireguard:${VPN_NAME}"; then
    nmcli con down "$VPN_NAME"
else
    nmcli con up   "$VPN_NAME"
fi

# попросим Waybar перерисовать модуль сразу же
pkill -SIGRTMIN+10 waybar

