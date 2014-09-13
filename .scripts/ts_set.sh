#!/usr/bin/env bash
# set -x
echo $(date -v ${1:-+0S} +%s) > $HOME/.ts
