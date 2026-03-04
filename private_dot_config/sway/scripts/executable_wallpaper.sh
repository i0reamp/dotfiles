#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/.cache/wallpapers"
CURRENT="$WALLPAPER_DIR/current.jpg"

mkdir -p "$WALLPAPER_DIR"

# Get a random wallpaper URL from Wallhaven (minimalist dark theme, 16:10, HiDPI)
api_url="https://wallhaven.cc/api/v1/search?q=minimalist+dark&sorting=random&ratios=16x10&atleast=2560x1600"
img_url=$(curl -s --max-time 10 "$api_url" | python3 -c "
import sys, json, random
try:
    d = json.load(sys.stdin)
    imgs = d.get('data', [])
    if imgs:
        print(random.choice(imgs)['path'])
except:
    pass
" 2>/dev/null)

if [ -z "$img_url" ]; then
    # Fallback to picsum if wallhaven fails
    img_url="https://picsum.photos/2880/1800"
fi

tmp="$WALLPAPER_DIR/new_$$.jpg"

if curl -sL -o "$tmp" --max-time 30 "$img_url" && [ -s "$tmp" ]; then
    if file "$tmp" | grep -qiE 'image|jpeg|png'; then
        mv "$tmp" "$CURRENT"
        pkill swaybg 2>/dev/null
        sleep 0.2
        swaybg -i "$CURRENT" -m fill &
        disown
    else
        rm -f "$tmp"
    fi
else
    rm -f "$tmp"
    # Use cached wallpaper if available
    if [ -f "$CURRENT" ]; then
        pgrep swaybg >/dev/null || { swaybg -i "$CURRENT" -m fill & disown; }
    fi
fi
