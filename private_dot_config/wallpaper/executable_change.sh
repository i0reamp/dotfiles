#!/usr/bin/env bash

DIR="$HOME/.config/wallpaper"
FILE="$DIR/current.jpg"
TEMP="$DIR/next.jpg"

# Download random photo from picsum.photos (Unsplash photos)
if curl -sfL -o "$TEMP" "https://picsum.photos/3120/2080"; then
    mv "$TEMP" "$FILE"
    swaymsg "output * bg $FILE fill" 2>/dev/null
fi
