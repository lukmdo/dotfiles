
update_bash_completion_d_files() {
  local D=$(dirname "${BASH_SOURCE[0]}")
  echo -e "\n\nUpdating:"
  for F in `ls $D/*_update.sh`; do
    echo -en "\n\t$F ... "
    source $F && _update_completion && echo -n "✅" || echo -n "‼️"
  done

  echo -e "\n\nStatus:"
  git status -- "$D"
}
