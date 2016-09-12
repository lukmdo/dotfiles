## ALIASES
alias ..="cd .."                              # Go up one directory
alias ...="cd ../.."                          # Go up two directories
alias l='ls -C -F'
alias ls="ls -a"                              # Show hidden
alias la="ls -AF"                             # Compact view, show hidden
alias ll="ls -lFh"                            # Show hidden, long view
alias rm="rm -i"                              # Are you sure?
alias mv="mv -i"                              # Are you sure?
alias free="free -m"                          # Show memory usage in megabytes
alias rmpyc="find . -name '*.pyc' -delete"    # Remove .PYC files.
alias ping="ping -c 5"                        # Pings with 5 packets, not unlimited
alias df="df -h"                              # Disk free, in gigabytes, not bytes
alias du="du -h -c"                           # Calculate total disk usage for a folder
alias rhino="java -jar ~/bin/rhino.jar"       # Begin a rhino session
alias prs="python -m SimpleHTTPServer"        # Simple python server
alias plan='$HOME/.scripts/plan.sh'           # All in one ~/.plan files and ~/.plan_dir

## NGINX ALIASES
alias nginx_restart="sudo nginx -s reload -c $HOME/.nginx/sites-enabled/default.conf"
alias nginx_start="sudo nginx -c $HOME/.nginx/sites-enabled/default.conf"
alias nginx_stop="sudo nginx -s stop"
alias nginx_this='rm -f ~/.nginx/sites-enabled/default.conf; cat ~/.nginx/sites-enabled/conf.template | sed -e "s/TEMPLATE_PATH/${PWD//\//\\/}/"| sed -e "s/HOME/${HOME//\//\\/}/" > ~/.nginx/sites-enabled/default.conf; nginx_stop; nginx_start'

## APACHE ALIASES
alias apache_restart="sudo /etc/init.d/apache2 restart"
alias apache_reload="sudo /etc/init.d/apache2 reload"
alias apache_start="sudo /etc/init.d/apache2 start"
alias apache_stop="sudo /etc/init.d/apache2"
alias apache_log="sudo vim /var/log/apache2/error.log"

## DJANGO ALIASES
alias rs="python manage.py runserver --settings=$DJANGO_SETTINGS_MODULE"
alias sdb="python manage.py syncdb --settings=$DJANGO_SETTINGS_MODULE"
alias dshell="django-admin.py shell --settings=$DJANGO_SETTINGS_MODULE"
alias dtest="django-admin.py test --settings=$DJANGO_SETTINGS_MODULE"

## MYSQL ALIASES
alias mysql_restart="sudo /etc/init.d/mysql restart"
alias mysql_start="sudo /etc/init.d/mysql start"
alias mysql_stop="sudo /etc/init.d/mysql stop"

## Postgres
alias postgresql_restart="sudo /etc/init.d/postgresql-8.3 restart"

## GIT ALIASES
alias git='hub'
alias g='git'
alias gb='git branch'
alias gba='git branch -a'  
alias gbd="git branch -d"
alias gbls='git for-each-ref --sort="-committerdate" --format="%(authordate:short)%09%(refname:short)" refs/heads | head'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcan='git commit --amend --no-edit'
alias gd='git diff | mate'
alias gl='git pull'
alias gp='git push'
alias gs="gitserve -p 8080 -a localhost"
alias gst='git status'
alias gpr='PR=`git pull-request`; echo $PR; echo $PR|pbcopy'
alias git-branches-cleanup='git branch --merged | grep -v "\*"| xargs -I {} sh -c "git push origin :{} ; git branch -d {}"'
alias gg="git grep"

## RABBITMQ
alias rabbit_start="sudo -H -u rabbitmq rabbitmq-server"

## TCPFLOW
alias flow_referrers="sudo tcpflow -c -i lo tcp port 8080 | grep Referer:"
alias flow_from="sudo tcpflow -c -i lo tcp port 8080 | grep From:"
alias flow_agent="sudo tcpflow -c -i lo tcp port 8080 | grep User-Agent:"
alias flow_location="sudo tcpflow -c -i lo tcp port 8080 | grep Location:"

## OS X tools for Linux 
if [ ! $(uname -s) = "Darwin" ]; then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
fi


## OWN ALIASES
alias pypath="python -c 'from pprint import pprint; import sys; pprint(sys.path)'" # Show pythonpath
alias ijython="jython $HOME/ENV@/java-readline/jipython/ipython-0.10/ipython.py"
alias pbwww='pbpaste |python -c "import webbrowser, sys; map(lambda url: webbrowser.open(url.strip()), sys.stdin.readlines())"'
alias ttop='watch  -n3 "ps caux -c |head|awk '\''{print \$3,\$4,\$NF}'\'' && echo && ps caux -m |head|awk '\''{print \$4,\$3,\$NF}'\'' " '
alias make_ls_targets="awk -F':' '/^[a-zA-Z0-9][^$#\/\t=]*:([^=]|$)/ {print \$1}' Makefile | sort"
alias topcoderArena="javaws http://www.topcoder.com/contest/arena/ContestAppletProd.jnlp"
alias rush='time timeout -s SIGKILL $*' # rush 10 sleep 12 
alias add="awk '{s+=\$1} END {print s}'"
alias date_utc="date -u"
alias date_sf="TZ=America/Los_Angeles date"
alias date_uk="TZ=Europe/London date"
alias date_pl="TZ=Europe/Warsaw date"
alias date_am="TZ=Asia/Yerevan date"
alias bac='_bac(){ mv $1 $1.bac; }; _bac'
# alias ubac='_ubac(){ mv $1 $1.bac; }; _bac'
alias count='sort | uniq -c | sort -rn'

## VERY OWN ALIASES
source ~/.bash_my_aliases
alias bsd="ssh -v -i ~/.ssh/ec2freebsd.pem ec2-user@52.19.234.236"

alias holidays_us="open /Users/lukmdo/Desktop/sL/hs2016.png"
alias holidays_uk="open https://www.gov.uk/bank-holidays"
alias gcalendar="open https://calendar.google.com"
