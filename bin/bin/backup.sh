#!/bin/sh
REPOSITORY=~/stackdav/thinkpadbackup

# Backup all of /home and /var/www except a few
# excluded directories
borg create -v --stats                          \
    $REPOSITORY::'{hostname}-{now:%Y-%m-%d}'    \
    /home/alrayyes                              \
    --exclude '/home/alrayyes/.cache' \
    --exclude '/home/alrayyes/stackdav' \
    --exclude '/home/alrayyes/music'            \
    --exclude '/home/alrayyes/Mac*'            \
    --exclude '/home/alrayyes/Dropbox'            \
    --exclude '/home/alrayyes/gPodder/Downloads'

# Use the `prune` subcommand to maintain 7 daily, 4 weekly and 6 monthly
# archives of THIS machine. The '{hostname}-' prefix is very important to
# limit prune's operation to this machine's archives and not apply to
# other machine's archives also.
borg prune -v --list $REPOSITORY --prefix '{hostname}-' \
    --keep-daily=7 --keep-weekly=4 --keep-monthly=6
