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
#alias rs="python manage.py runserver --settings=$DJANGO_SETTINGS_MODULE"
#alias sdb="python manage.py syncdb --settings=$DJANGO_SETTINGS_MODULE"
#alias dshell="django-admin.py shell --settings=$DJANGO_SETTINGS_MODULE"
#alias dtest="django-admin.py test --settings=$DJANGO_SETTINGS_MODULE"

## MYSQL ALIASES
alias mysql_restart="sudo /etc/init.d/mysql restart"
alias mysql_start="sudo /etc/init.d/mysql start"
alias mysql_stop="sudo /etc/init.d/mysql stop"

## Postgres
alias postgresql_restart="sudo /etc/init.d/postgresql-8.3 restart"

## GIT ALIASES
___git_complete g __git_main  # ALIAS/BASH-COMPLETION REMAP
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
alias gpr='PR=`git pull-request`; echo $PR | pbcopy'
alias git-branches-cleanup='git branch --merged | grep -v "\*"| xargs -I {} sh -c "git push origin :{} ; git branch -d {}"'
alias gg="git grep"
alias open_mr="lab mr browse"

# ## RABBITMQ
# alias rabbit_start="sudo -H -u rabbitmq rabbitmq-server"

## TCPFLOW
alias flow_referrers="sudo tcpflow -c -i lo tcp port 8080 | grep Referer:"
alias flow_from="sudo tcpflow -c -i lo tcp port 8080 | grep From:"
alias flow_agent="sudo tcpflow -c -i lo tcp port 8080 | grep User-Agent:"
alias flow_location="sudo tcpflow -c -i lo tcp port 8080 | grep Location:"

# ## OS X tools for Linux
# if [ ! $(uname -s) = "Darwin" ]; then
#     alias pbcopy='xsel --clipboard --input'
#     alias pbpaste='xsel --clipboard --output'
# fi

alias pbcopy="tee >(env pbcopy)" # clipboard and stdout
alias pbcopy-no-out="env pbcopy" # clipboard only
alias pbpaste_json="pbpaste | jq"
alias pbpaste_base64="pbpaste | base64 -D"

## OWN ALIASES
alias chrome="open -a 'Google Chrome'"
alias pypath="python -c 'from pprint import pprint; import sys; pprint(sys.path)'" # Show pythonpath
alias ijython="jython $HOME/ENV@/java-readline/jipython/ipython-0.10/ipython.py"
alias pbwww='pbpaste |python -c "import webbrowser, sys; map(lambda url: webbrowser.open(url.strip()), sys.stdin.readlines())"'
alias make_ls_targets="awk -F':' '/^[a-zA-Z0-9][^$#\/\t=]*:([^=]|$)/ {print \$1}' Makefile | sort"
alias topcoderArena="javaws http://www.topcoder.com/contest/arena/ContestAppletProd.jnlp"
alias bytes2='numfmt --to=iec-i --format="%.2f"' # --suffix=B

# DOCKER
alias dr='docker'
alias docker_run='docker run -it --rm'
alias docker_run_entrypoint='docker_run --entrypoint'
alias docker_exec='docker exec -it'
alias docker_clean='docker rm $(docker ps -a -q)'
alias docker_ps='docker ps -a'
alias docker_ps_exited='docker ps -a --filter status=exited'

# docker image ls NAME
#alias docker_size='docker inspect -f "{{ .Size }}"' # docker_size NAME | bytes2

# K8S
complete -o default -F __start_kubectl k # ALIAS/BASH-COMPLETION REMAP
alias k="kubectl"
# kx and kxx uses bash-preexec.sh
alias kx="kubectl config get-contexts | egrep \"NAME|\*\""
alias kxx='kubectl config use-context $KUBE_CONTEXT'

alias kubectl_exec='kubectl exec NAME --stdin --tty'
alias kubectl_context='kubectl config current-context'
alias minikube_strart='minikube start && eval $(minikube docker-env)'

# OPENSSL
alias openssl_check_key='openssl rsa -check -in' # FILE AS ARG
alias openssl_check_cert='openssl x509 -text -noout -in' # FILE AS ARG
alias openssl_verify_cert='openssl verify -verbose -CAfile' # 2ARGS: ca.pem cert.pem

# alias bac='_bac(){ mv $1 $1.bac; }; _bac'
# alias ubac='_ubac(){ mv $1 $1.bac; }; _bac'

alias add='awk "{s+=\$1} END {print s}"'
alias count='sort | uniq -c | sort -rn'
alias nmax='count | head'
alias nmin='count | tail'
alias pname='awk -v ORS=" " "{ print \$0; system(\"ps -o comm= -p\" \$NF) }"'

# TIME:
# ls /usr/share/zoneinfo
alias date_utc="date -u"
alias date_br="TZ=Brazil/East date"
alias date_sf="TZ=America/Los_Angeles date"
alias date_ny="TZ=America/New_York date"
alias date_nz="TZ=NZ date"
alias date_jp="TZ=Japan date"
alias date_uk="TZ=Europe/London date"
alias date_pl="TZ=Europe/Warsaw date"
alias date_pt="TZ=US/Pacific date"

# alias date_am="TZ=Asia/Yerevan date"
alias date_stamp="date +%Y%m%dT%H%M%S"
alias stamp='xargs -L1 echo $(date "+%H:%M:%S")'
alias rush='time timeout $*' # rush 10 sleep 12

# NETWORKING
alias ip='curl -s httpbin.org/ip | awk "/origin/ {gsub(\"\\\"\", \"\"); print \$2}" | pbcopy'
alias ip_l='ifconfig en0 | awk "\$1==\"inet\" {print \$2}" '
alias dns_clear_cache='sudo killall -HUP mDNSResponder'

alias pgrep_all="pgrep -f -l"

# OTHER
# `src` tool https://docs.sourcegraph.com/cli
# OR in browser https://docs.sourcegraph.com/integration/browser_extension/how-tos/browser_search_engine
alias codesearch="src search -insecure-skip-verify --"
alias jwt-decode="jq -R 'split(\".\")[0,1] | @base64d | fromjson'"

# GH
alias gh_action_workflow_ref="chrome 'https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions'"
