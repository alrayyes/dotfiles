#!/bin/sh

rsync -az --delete --progress alrayyes@eniac:/mnt/storage/music/ ~/music/headphones
rsync -az --delete --progress --inplace --size-only ~/music/headphones/ ~/stackdav/music
