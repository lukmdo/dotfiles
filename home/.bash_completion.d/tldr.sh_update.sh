
_update_completion() {
    # https://github.com/dbrgn/tealdeer/tree/main/completion
    # https://dbrgn.github.io/tealdeer/installing.html#autocompletion
    curl -Ls https://raw.githubusercontent.com/dbrgn/tealdeer/main/completion/bash_tealdeer > ~/.bash_completion.d/tldr.sh

    tldr --update
}
