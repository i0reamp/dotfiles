#!/usr/bin/env bash

PROXY_HOST="127.0.0.1"
PROXY_PORT="10488"

mode=$(gsettings get org.gnome.system.proxy mode)

if [ "$mode" = "'manual'" ]; then
    gsettings set org.gnome.system.proxy mode 'none'
else
    gsettings set org.gnome.system.proxy mode 'manual'
    gsettings set org.gnome.system.proxy.http host "$PROXY_HOST"
    gsettings set org.gnome.system.proxy.http port "$PROXY_PORT"
    gsettings set org.gnome.system.proxy.https host "$PROXY_HOST"
    gsettings set org.gnome.system.proxy.https port "$PROXY_PORT"
fi

pkill -SIGRTMIN+9 waybar
