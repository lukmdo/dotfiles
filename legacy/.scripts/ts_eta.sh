#!/usr/bin/env bash
# set -x
TS=$(cat $HOME/.ts)
SEC=$(($TS-$(date +%s)))

if [ $SEC -lt 0 ]; then SEC=0; fi

date -u -r $SEC +%M:%S


