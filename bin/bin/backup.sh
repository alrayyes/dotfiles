#!/bin/sh
REPOSITORY=~/mnt/backups

# Backup all of /home and /var/www except a few
# excluded directories
borg create -v --stats                         \
    --compression lz4                          \
    $REPOSITORY::'{hostname}-{now:%Y-%m-%d}'    \
    /home/alrayyes                              \
    --exclude '/home/alrayyes/.cache' \
    --exclude '/home/alrayyes/mnt' \
    --exclude '/home/alrayyes/music'            \
    --exclude '/home/alrayyes/gPodder/Downloads' \
    --exclude '/home/alrayyes/Macbook\ Import'

# Use the `prune` subcommand to maintain 7 daily, 4 weekly and 6 monthly
# archives of THIS machine. The '{hostname}-' prefix is very important to
# limit prune's operation to this machine's archives and not apply to
# other machine's archives also.
borg prune -v --list $REPOSITORY --prefix '{hostname}-' \
    --keep-daily=7 --keep-weekly=4 --keep-monthly=6
