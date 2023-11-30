#!/usr/bin/env bash

set -euo pipefail

# Top vars with defaults
: "${BASH_COMPLETION_D_PATH:="$(echo ~/.bash_completion.d)"}"
: "${DOTFILES_ROOT_PATH:="$(dirname "$(dirname "$(dirname "$(dirname "$(
    readlink -f "${BASH_SOURCE[0]}")")")")")"}"

update_bash_completion_d_files() {
    echo -e "Updating:"
    for F in "${BASH_COMPLETION_D_PATH}"/*_update.sh; do
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
