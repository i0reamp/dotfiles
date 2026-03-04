#!/usr/bin/env bash

PROXY_HOST="127.0.0.1"
PROXY_PORT="10488"
PROXY_URL="http://${PROXY_HOST}:${PROXY_PORT}"

mode=$(gsettings get org.gnome.system.proxy mode)

if [ "$mode" = "'manual'" ]; then
    gsettings set org.gnome.system.proxy mode 'none'

    unset HTTP_PROXY HTTPS_PROXY http_proxy https_proxy NO_PROXY no_proxy
    dbus-update-activation-environment --systemd HTTP_PROXY='' HTTPS_PROXY='' http_proxy='' https_proxy='' NO_PROXY='' no_proxy=''
else
    gsettings set org.gnome.system.proxy mode 'manual'
    gsettings set org.gnome.system.proxy.http host "$PROXY_HOST"
    gsettings set org.gnome.system.proxy.http port "$PROXY_PORT"
    gsettings set org.gnome.system.proxy.https host "$PROXY_HOST"
    gsettings set org.gnome.system.proxy.https port "$PROXY_PORT"
    gsettings set org.gnome.system.proxy ignore-hosts "['localhost', '127.0.0.1', '10.*', '192.168.*', '*.lan', '*.amicon.ru']"

    export HTTP_PROXY="$PROXY_URL" HTTPS_PROXY="$PROXY_URL"
    export http_proxy="$PROXY_URL" https_proxy="$PROXY_URL"
    export NO_PROXY="localhost,127.0.0.1,10.0.0.0/16,192.168.0.0/16,.lan,.amicon.ru" no_proxy="localhost,127.0.0.1,10.0.0.0/16,192.168.0.0/16,.lan,.amicon.ru"
    dbus-update-activation-environment --systemd HTTP_PROXY HTTPS_PROXY http_proxy https_proxy NO_PROXY no_proxy
fi

pkill -SIGRTMIN+9 waybar
