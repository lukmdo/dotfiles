#!/usr/bin/env bash
# shows diff between dotfiles dir and $HOME dir

DIFF_STATUS=""
for item in `ls -a ./`; do
  case "$item" in
    "." |".."|"README"|"`basename $0`" ) ;;
    * ) 
      if [ -f "$item" ]; then
        diff -q "$HOME/$item" "./$item" >/dev/null
        if [ "$?" -ne 0 ]; then 
          vimdiff "$HOME/$item" "./$item"
          DIFF_STATUS=1
        fi
      fi;;
  esac
done

if [ -z "$DIFF_STATUS" ]; then
  echo "There are no differences"
fi
