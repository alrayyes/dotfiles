#!/bin/sh

clear

WIDTH=$(xrandr | grep '\*' | awk -F 'x' '{print $1}' | sed 's/ //g')
OUTPUT_IMAGE="$HOME/.cache/wall.png"

echo "Converting ${1} to ${OUTPUT_IMAGE}...."
convert "${1}" "${OUTPUT_IMAGE}"
echo "done!"
echo "Reszing ${OUTPUT_IMAGE} to width ${WIDTH}...."
convert "${OUTPUT_IMAGE}" -resize "${WIDTH}"x "${OUTPUT_IMAGE}"

echo "Setting background to ${OUTPUT_IMAGE}"
feh --bg-scale ~/.cache/wall.png

echo "done!"