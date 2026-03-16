#!/usr/bin/env bash

if ping -c1 -W2 amiserv.amicon.lan &>/dev/null; then
    printf '{"text":"󰌾 Amicon","tooltip":"VPN connected","class":"connected"}\n'
else
    printf '{"text":"󰌿 Amicon","tooltip":"VPN disconnected","class":"disconnected"}\n'
fi
