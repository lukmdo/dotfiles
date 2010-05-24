# ~/.bash_profile: executed by bash(1) for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.


# Setting PATH for MacPython 2.5
# The orginal version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"

# the default umask is set in /etc/login.defs
#umask 022
alias ls='ls -G'
alias g='git'
# include .bashrc if it exists
if [ -f $HOME/.bashrc ]; then
    source $HOME/.bashrc
fi

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi
#DBIC_NO_WARN_BAD_PERL=1
#PS1="\[\033[1;31m\]\t\[\033[0m\] \h@\u:\w\$ "
#export PS1
#export DBIC_NO_WARN_BAD_PERL
export MYSQL_PS1="(\u@\h) [\d]> "


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
PATH="${HOME}/ENV@/gwt/:${PATH}"

# To tell pip to only run if there is a virtualenv currently activated, and to bail if not
export PIP_REQUIRE_VIRTUALENV=true                                 

# To tell pip to automatically use the currently active virtualenv 
export PIP_RESPECT_VIRTUALENV=true
