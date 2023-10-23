#!/usr/bin/env bash

set -euo pipefail

SCRIPTS_DIR_PATH=$(dirname "${BASH_SOURCE[0]}")
DOTFILES_ROOT_PATH=$(dirname "$SCRIPTS_DIR_PATH")
BASH_COMPLETION_D_PATH="${DOTFILES_ROOT_PATH}/home/.bash_completion.d/"

update_bash_completion_d_files() {

  echo -e "Updating:"
  for F in `ls "${BASH_COMPLETION_D_PATH}"/*_update.sh`; do
    echo -en "\n\t$F ... "
    source $F && _update_completion 2>&1 \
      | sed 's/^/\t\t/' \
      && echo -n "✅" || echo -n "‼️"
  done
}

show_dotfiles_status() {
  echo -e "\n\nStatus: (dotfiles - git status)\n"
  git -C "$DOTFILES_ROOT_PATH" -c color.status=always status | \
   sed 's/^/\t\t/'

}

update_bash_completion_d_files
show_dotfiles_status
