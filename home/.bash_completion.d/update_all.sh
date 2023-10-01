#!/usr/bin/env bash

update_bash_completion_d_files() {
  local D=$(dirname "${BASH_SOURCE[0]}")
  for F in `ls $D/update_*.sh`; do
    source $F && _update_completion;
  done
  git status
}
