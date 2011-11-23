# ~/.bash_profile: executed by bash(1) for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

if [ ! -d "$HOME/bin" ] ; then
  mkdir "$HOME/bin"
fi

PATH="$HOME/bin":"${PATH}"
export PERL5LIB="$HOME/ENV@/lib/perl5/site_perl/5.8.9/:$PERL5LIB"
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"
export MANPATH="${HOME}/ENV@/man/:${HOME}/ENV@/share/man/:$MANPATH"

#export CLASSPATH="${HOME}/ENV@/java-readline/libreadline-java.jar:${CLASSPATH}"
#export LD_LIBRARY_PATH="${HOME}/ENV@/java-readline/:${LD_LIBRARY_PATH}"

# include .bashrc if it exists
if [ -f $HOME/.bashrc ]; then
  source $HOME/.bashrc
fi

if [ -f $HOME/.bash_aliases ]; then 
  source $HOME/.bash_aliases  
fi

if [ -f $HOME/.bash_prompt ]; then
  source $HOME/.bash_prompt
fi

if [ -f $HOME/.scripts/resty/resty ]; then
  source $HOME/.scripts/resty/resty
  ln -fs $HOME/.scripts/resty/pp $HOME/bin/
  ln -fs $HOME/.scripts/resty/pypp $HOME/bin/
fi

# -----------------------
# virtualenvwrapper Stuff
## To tell pip to only run if there is a virtualenv currently activated, and to bail if not
export PIP_REQUIRE_VIRTUALENV=true                                 

VIRTUALENVWRAPPER="$HOME/.scripts/virtualenvwrapper.sh"
if [ -n "$VIRTUALENVWRAPPER" ];then
  if [ ! -d "$HOME/.virtualenvs" ];then mkdir "$HOME/.virtualenvs";fi
  export WORKON_HOME="$HOME/.virtualenvs"
  export PIP_VIRTUALENV_BASE="$WORKON_HOME"
  export PIP_RESPECT_VIRTUALENV=true # use currently activated virtualenv
  source "$VIRTUALENVWRAPPER"
fi

