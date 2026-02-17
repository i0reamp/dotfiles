#!/usr/bin/env python3
import subprocess, os, json

VPN = os.getenv("VPN_NAME", "vdsina")

active = subprocess.run(
    ["nmcli", "-t", "-f", "TYPE,NAME", "con", "show", "--active"],
    capture_output=True, text=True
).stdout

connected = f"wireguard:{VPN}" in active
out = {
    "text": "" if connected else " ",  # иконки из Nerd Fonts
    "tooltip": f"{'Connected' if connected else 'Disconnected'}: {VPN}",
    "class": "connected" if connected else "disconnected"
}
print(json.dumps(out))        # Waybar ждёт ровно одну JSON‑строку

