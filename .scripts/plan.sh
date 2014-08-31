#!/usr/bin/env bash
# set -x
PATH="/usr/local/bin:$PATH"
EDITOR=$(which mate)

$EDITOR -w /Users/lukmdo/.plan_dir/lukmdo_plan_$(date -v ${*:-+0d} +"%Y%m%d").txt; 
ln -fs $(ls $HOME/.plan_dir/* | tail -1) $HOME/.plan;
