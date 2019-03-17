#!/bin/sh

WIDTH=$(xrandr | grep '\*' | awk -F 'x' '{print $1}' | sed 's/ //g')
convert "$1" ~/.config/lock.png
convert ~/.config/lock.png -resize "${WIDTH}"x ~/.config/lock.png
