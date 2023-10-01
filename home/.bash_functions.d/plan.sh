#!/usr/bin/env bash

_plan() {
# set -x
  local PATH="/usr/local/bin:$PATH"
  local EDITOR=$(which mate)
  local PREFIX="/Users/lukmdo/.plan_dir/lukmdo_plan_"

  local DATES=${*:-+0d}
  local DATES_F=$(echo -n $DATES | xargs -t -n1 -I {} date -v {} +%Y%m%d)
  local FILES=$(echo -n $DATES_F | xargs -t -n1 -I {} echo ${PREFIX}{}.txt)

  $EDITOR -w $FILES
  ln -fs $(ls $HOME/.plan_dir/* | tail -1) $HOME/.plan
}

# TODO: drop not needed?!
# _plan
