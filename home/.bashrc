# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export EDITOR="vi"
export HISTSIZE=10000
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL="ignoreboth"
export PYTHONSTARTUP=~/.pythonstartup
export TM_PYCHECKER="pylint"

#export PYTHONDOCS="/usr/share/doc/python26/"
#export PATH="/usr/local/bin/:${PATH}:/usr/local/mysql/bin/:/usr/local/pgsql/bin/:/opt/local/bin:/opt/local/sbin"
#export MANPATH="/opt/local/share/man:$MANPATH"

# -----------------------
# virtualenvwrapper Stuff
# VIRTUAL_BASHRC="`which virtualenvwrapper_bashrc`"
# if [ -n "$VIRTUAL_BASHRC" ];then
#   if [ ! -d "$HOME/.virtualenvs" ];then mkdir "$HOME/.virtualenvs";fi
#   export WORKON_HOME="$HOME/.virtualenvs"
#   export PIP_VIRTUALENV_BASE=$WORKON_HOME
#   source "$VIRTUAL_BASHRC"
# fi

shopt -s checkwinsize
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b 2>/dev/null`"
    alias ls='ls --color=auto'
fi
