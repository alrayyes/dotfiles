#!/usr/bin/env sh

xrdb -merge -I$HOME ~/.Xresources

exec bspwm
