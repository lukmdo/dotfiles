# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export EDITOR="vi"
export HISTCONTRO="ignoredups"
export HISTCONTROL="ignoreboth"
export PYTHONSTARTUP=~/.pythonstartup
export PYTHONDOCS="/usr/share/doc/python26/"
export PATH="/usr/local/bin/:${PATH}:/usr/local/mysql/bin/:/usr/local/pgsql/bin/:/opt/local/bin" 

# -----------------------
# virtualenvwrapper Stuff
VIRTUAL_BASHRC="`which virtualenvwrapper_bashrc`"
if [ -n "$VIRTUAL_BASHRC" ];then
  if [ ! -d "$HOME/.virtualenvs" ];then mkdir "$HOME/.virtualenvs";fi
  export WORKON_HOME="$HOME/.virtualenvs"
  source "$VIRTUAL_BASHRC"
fi

shopt -s checkwinsize 
if [ "$TERM" != "dumb" ]; then 
	eval "`dircolors -b`"
	alias ls='ls --color=auto'
fi
alias ll='ls -l'
alias la='ls -A'
alias l='ls -C -F'
#alias mysql='/usr/local/mysql/bin/mysql'
#alias mysqladmin='/usr/local/mysql/bin/mysqladmin'
if [ -f /etc/bash_completion ]; 
	then . /etc/bash_completion
fi
#export LS_COLORS='no=00:fi=00:di=01;33:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.flac=01;35:*.mp3=01;35:*.mpc=01;35:*.ogg=01;35:*.wav=01;35:'

if [ -f ~/.scripts/common.sh ]; then . ~/.scripts/common.sh; fi
if [ -f ~/.git_completion.sh ]; then . ~/.git_completion.sh; fi
if [ -f ~/.hg_completion ];     then . ~/.hg_completion; fi

#X=$(git branch 2>/dev/null | grep -e '^*'| sed -e 's/* //'); if [ $? -eq 0 ];then
#    BRANCH=$(git branch | grep -e '^*'| sed -e 's/* //')
#    PS1="\[\033[1;31m\]>>>> $BRANCH \t\[\033[0m\] \h@\u:\w\$ "
#else
export PS1="\[\033[1;31m\]>>>> \t\[\033[0m\] \h@\u:\w\$ "
#fi
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
HISTSIZE=10000
