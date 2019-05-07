#!/bin/sh

. /home/alrayyes/.restic
restic backup --exclude-file=/home/alrayyes/.config/restic/exclude.txt /home/alrayyes
restic forget -m 6 --prune
