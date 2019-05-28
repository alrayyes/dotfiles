#!/bin/sh

clear

if [ "${2}" = "2" ]
then
    OUTPUT_IMAGE="$HOME/.cache/wall2.png"
    WIDTH=$(xrandr | grep '\*' | sed -n '1p' | awk -F 'x' '{print $2}' | awk -F '_' '{print $1}' | sed 's/ //g')
    HEIGHT=$(xrandr | grep '\*' | sed -n '1p' | awk -F 'x' '{print $1}' | sed 's/ //g')
else
    OUTPUT_IMAGE="$HOME/.cache/wall1.png"
    # Use tail -n 1 to get last monitor so this works with laptop as well
    WIDTH=$(xrandr | grep '\*' | tail -n 1 | awk -F 'x' '{print $1}' | sed 's/ //g')
    HEIGHT=$(xrandr | grep '\*' | tail -n 1 | awk -F 'x' '{print $2}' | awk '{print $1}' | sed 's/ //g')
fi

echo "Converting ${1} to ${OUTPUT_IMAGE}"
convert "${1}" "${OUTPUT_IMAGE}"

echo "Resizing ${OUTPUT_IMAGE} to ${WIDTH}x${HEIGHT}"
convert "${OUTPUT_IMAGE}" -resize "${WIDTH}x${HEIGHT}^" -gravity center -extent "${WIDTH}"x"${HEIGHT}" "${OUTPUT_IMAGE}"

echo "Setting background images...."
feh --bg-scale ~/.cache/wall1.png --bg-scale ~/.cache/wall2.png

echo "done!"
