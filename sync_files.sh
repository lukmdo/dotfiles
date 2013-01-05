#!/usr/bin/env bash
# shows diff between dotfiles dir and $HOME dir
# Its simple version that uses vimdiff to compare
# fike differences. For now directories are skiped.

PATTERN=""
DIFF_STATUS=""
ITEMS=`ls -a`;

while getopts ":f:d:" option
do
  case $option in
    f  ) if [ -n "$OPTARG" ]; then PATTERN="$OPTARG"; ITEMS=`find ./$(dirname "$OPTARG") -type f -name "$(basename "$OPTARG")"`;fi;;
    d  ) if [ -n "$OPTARG" ]; then PATTERN="$OPTARG"; ITEMS=`find ./$(dirname "$OPTARG") -type d -name "$(basename "$OPTARG")"`;fi;;
    "?") echo "Unknown option $OPTARG"; exit 2;;
  esac
done

if [ ${#ITEMS[@]} -eq 1 ] && [ -z "${ITEMS[0]}" ]; then
  echo "${PATTERN}: No such file or directory";
  exit 1;
fi

for item in $ITEMS; do
  case "$item" in
    "." |".."|".git"|".//.git"|"Makefile"|README*|"`basename $0`"|"other"|".pycharm_settings.jar" ) ;;
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
