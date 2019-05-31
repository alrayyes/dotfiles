#!/usr/bin/env bash

for d in `ls -d */ | cut -f1 -d '/'`;
do
    ( stow $d  )
done
