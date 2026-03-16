#!/usr/bin/env bash

ip-client DISCONNECT

# Restore default DNS (let DHCP handle it)
sudo resolvectl revert global

pkill -SIGRTMIN+10 waybar
