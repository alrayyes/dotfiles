#!/usr/bin/env sh

xrdb -load ~/.config/X11/xresources -merge -I$HOME ~/.Xresources

exec bspwm
