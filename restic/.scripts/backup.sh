#!/bin/sh

. /home/alrayyes/.restic
restic backup --exclude-file=/home/alrayyes/.config/restic/exclude.txt /home/alrayyes /etc
restic forget -m 12 -w 4 -d 14 --prune
