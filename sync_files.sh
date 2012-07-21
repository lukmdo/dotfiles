#!/usr/bin/env bash
# shows diff between dotfiles dir and $HOME dir
# Its simple version that uses vimdiff to compare
# fike differences. For now directories are skiped.

PATTERN="$*"

DIFF_STATUS=""
for item in `ls -a |grep "$PATTERN"`; do
  case "$item" in
    "." |".."|".git"|"Makefile"|README*|"`basename $0`"|"other" ) ;;
    * )
      diff -q "$HOME/$item" "./$item" >/dev/null
      if [ "$?" -ne 0 ]; then
        DIFF_STATUS=1
        if [ -d "$item" ]; then
          if [ ! -d "$HOME/$item" ]; then
            mkdir "$HOME/$item"
          fi
          vim '+execute "DirDiff" argv(0) argv(1)' "$HOME/$item" "./$item"
        else
          vimdiff "$HOME/$item" "./$item"
        fi
      fi
  esac
done

if [ -z "$DIFF_STATUS" ]; then
  echo "There are no differences"
fi

