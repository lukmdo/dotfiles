#!/usr/bin/env bash

# ----------- svn shortcuts ------------
#svndiff () { svn di $* | vim -; }
#st () { svn st $*; }
#stm () { svn st $*|grep -v ^[?X]; }
# -------------------------------------

# ----------- git shortcuts ------------
gitdiff () { git diff $* | vim -; }
# -------------------------------------

pwc () { perl -wc $*; }
rdo () { for file in `ls -1`; do $* $file; done; }

md5dir () {
    if [ ! -d "$1" ]; then
        echo "$1: No such directory"
        return 2
    fi

    pushd `pwd` &> /dev/null
    cd $1 &>/dev/null
    dir_path=`pwd`
    popd &> /dev/null

    hash md5 &> /dev/null
    if [ $? -eq 0 ]; then
        find -s $dir_path -type f -exec md5 {} \; | awk '{print $NF}' | md5
    else
        find -s $dir_path -type f -exec md5sum {} \; | awk '{print $NF}' | md5sum
    fi
}

sc () {
    # source check
    for FILE in $*; do
        ft=`echo $FILE |awk -F. '{print $(NF)}'`
        case $ft in
            *.pl|*.pm ) perl -wc $FILE;;
            *.py      ) ERRORS=`python -c "import py_compile; py_compile.compile(r'$FILE')"`
                if [ -z "$ERRORS" ]; then echo "$FILE syntax OK";else echo $ERROR; fi;;
            *.sh      ) ERRORS="`bash -n "$FILE"`"
                if [ -z "$ERRORS" ]; then echo "$FILE syntax OK";else echo $ERROR; fi;;
            *.rb      ) ERRORS="`ruby -c "$FILE"`"
                if [ -z "$ERRORS" ]; then echo "$FILE syntax OK";else echo $ERROR; fi;;
            *         ) echo "Unknown file type: $ft of $FILE";;
        esac
    done
}

acat () {
    # ascii cat
    # show \r \t \n in file. hexdump -c inspired but simplier output
    # gsed required to replace with newlines
    hexdump -v -e '"%_c"' $* | gsed -e 's/\\n/\\n\n/g';
}

asum () {
    awk '{sum += $1} END {print sum}'
}

ram () {
    # quick memory (free|wired|active) status info
    vm_stat | awk -F: '/(free|wired|active)/ {print substr($1, 7), "\r\t\t", sprintf("%.f", ($2 * 4096) / 2^20)}';
    sysctl vm.swapusage
}

# gsub(\""\", \"\");
# alias ip='curl -s httpbin.org/ip | awk "/origin/ {gsub(\"\\\"\", \"\"); print \$2}"'

ncol () {
    COLS=\$$*;            # prepend `$`
    COLS=${COLS//,/,\$};  # s/,/,$/g
    COLS=$(echo $COLS | sed 's/-\([0-9]*\)/(NF-\1+1)/g')
    awk "{print $COLS}"
}

ttop () {
    if [ "$1" = "-v" ] ;then
        LONG_COMM="command";
        NSEC=${2:-3};
    else
        LONG_COMM="";
        NSEC=${1:-3};
    fi;

    watch -n $NSEC "
        top -l1 | head -n1
        echo;
        ps ax -o %cpu,%mem,pid,etime,ucomm,${LONG_COMM} -r |head;
        echo;
        ps ax -o %mem,%cpu,pid,etime,ucomm,${LONG_COMM} -m |head;
        echo;
        printf \"%12s\n\" \"# COMMAND\";
        ps ax -o ucomm,${LONG_COMM} |sort|uniq -c|sort -rn| head
        ";
}

jira () {
    if [ -z $1 ]; then
        # new jira if no param
        chrome "$JIRA_HOST/secure/CreateIssue!default.jspa"
    else
        chrome "$JIRA_HOST/browse/${1^^}"
    fi;
}

__ () {
    open "dash://$1$2$3"
}

so () {
    chrome "https://stackoverflow.com/questions/$1"
}

gcp_webconsole() {
    chrome "https://console.cloud.google.com/kubernetes/clusters/details/${GCP_REGION}/${GCP_CLUSTER}/details?project=${GCP_PROJ}"
}

path_prepend() {
    [[ -d "$1" ]] || return 2
    [[ ":$PATH:" = *":$1:"* ]] && return 0
    export PATH="$1:${PATH}"
}

path_drop() {
    local p=":$PATH:"
    [[ "$p" != *":$1:"* ]] && return 0
    p="${p//:$1:/}"
    p="${p#:}"; p="${p%:}"
    export PATH="$p"
}

