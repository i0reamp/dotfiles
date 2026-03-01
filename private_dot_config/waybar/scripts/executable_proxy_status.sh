#!/usr/bin/env bash

mode=$(gsettings get org.gnome.system.proxy mode)

if [ "$mode" = "'manual'" ]; then
    host=$(gsettings get org.gnome.system.proxy.http host | tr -d "'")
    port=$(gsettings get org.gnome.system.proxy.http port)
    printf '{"text":"󰒃 ","tooltip":"Proxy: %s:%s","class":"on"}\n' "$host" "$port"
else
    printf '{"text":"󰒄 ","tooltip":"Proxy OFF","class":"off"}\n'
fi
