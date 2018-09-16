#!/usr/bin/env bash
# set -x
PATH="/usr/local/bin:$PATH"
EDITOR=$(which mate)
PREFIX="/Users/lukmdo/.plan_dir/lukmdo_plan_"

DATES=${*:-+0d}
DATES_F=$(echo -n $DATES | xargs -t -n1 -I {} date -v {} +%Y%m%d)
FILES=$(echo -n $DATES_F | xargs -t -n1 -I {} echo ${PREFIX}{}.txt)


$EDITOR -w $FILES 
ln -fs $(ls $HOME/.plan_dir/* | tail -1) $HOME/.plan

