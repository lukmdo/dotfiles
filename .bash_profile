# ~/.bash_profile: executed by bash(1) for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.


export MANPATH="${HOME}/ENV@/man/:${HOME}/ENV@/share/man/:$MANPATH"
#export CLASSPATH="${HOME}/ENV@/java-readline/libreadline-java.jar:${CLASSPATH}"
#export LD_LIBRARY_PATH="${HOME}/ENV@/java-readline/:${LD_LIBRARY_PATH}"

 #Setting PATH for MacPython 2.5
# The orginal version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"

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

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

export PERL5LIB="$HOME/ENV@/lib/perl5/site_perl/5.8.9/:$PERL5LIB"


##
# Your previous /Users/serpiente/.bash_profile file was backed up as /Users/serpiente/.bash_profile.macports-saved_2009-11-14_at_12:01:11
##

# MacPorts Installer addition on 2009-11-14_at_12:01:11: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


##
# Your previous /Users/serpiente/.bash_profile file was backed up as /Users/serpiente/.bash_profile.macports-saved_2009-11-14_at_12:48:33
##

# MacPorts Installer addition on 2009-11-14_at_12:48:33: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


# Setting PATH for MacPython 2.6
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.6/bin:${PATH}"
export PATH

# PERLSONAL stuff
PATH="${HOME}/ENV@/bin/:${HOME}/ENV@/gwt/:${PATH}"

