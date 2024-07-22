_update_completion() {
    # updates cheat/cheatsheets-community items
    # change dirs silently
    pushd ~/.config/cheat/cheatsheets/community/ > /dev/null
    git pull --quiet origin master
    popd > /dev/null
}
