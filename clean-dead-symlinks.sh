#!/bin/sh

find ~ -type l -exec test ! -e {} \; -delete
