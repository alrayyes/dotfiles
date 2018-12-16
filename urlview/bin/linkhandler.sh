#!/bin/sh

# List of sites that will be opened in mpv.
vidsites="youtube.com"
ext="${1##*.}"
mpvFiles="mkv mp4 gif webm mp3 flac"
fehFiles="png jpg jpeg jpe"
wgetFiles="iso"

if echo $fehFiles | grep -w $ext > /dev/null; then
	feh "$1" >/dev/null & disown
elif echo $mpvFiles | grep -w $ext > /dev/null; then
	mpv -quiet "$1" > /dev/null & disown
elif echo $wgetFiles | grep -w $ext > /dev/null; then
	wget "$1" >/dev/null & disown
elif echo "$@" | grep "$vidsites">/dev/null; then
	mpv -quiet "$1" > /dev/null & disown
else
    firefox "$1" 2>/dev/null & disown
fi
