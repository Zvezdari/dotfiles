#!/bin/bash

WALL_DIR="$HOME/Pictures/wallpapers"

# Start awww daemon if not running
if ! pidof awww-daemon >/dev/null; then
    awww-daemon &
    sleep 0.5
fi

SELECTED=$(
	find "$WALL_DIR" -type f | while read -r img; do
 	[[ "$img" =~ \.(jpg|jpeg|png|webp|JPG|PNG)$ ]] || continue

        REL_PATH="${img#$WALL_DIR/}"
	printf "%s\0icon\x1f%s\n" "$REL_PATH" "$img"
    done | rofi \
        -dmenu \
        -i \
        -show-icons \
        -theme ~/.config/rofi/wallpaper.rasi \
        -p ""
)

if [ -n "$SELECTED" ]; then
    awww img "$WALL_DIR/$SELECTED" \
        --transition-type grow \
        --transition-duration 2
    matugen image "$WALL_DIR/$SELECTED" \
        --source-color-index 1 || \
    matugen image "$WALL_DIR/$SELECTED" \
        --source-color-index 0
fi
