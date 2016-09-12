# ----------- svn shortcuts ------------
svndiff () { svn di $* | vim -; }
st () { svn st $*; }
stm () { svn st $*|grep -v ^[?X]; } 
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

ram () {
    # quick memory (free|wired|active) status info
    vm_stat | awk -F: '/(free|wired|active)/ {print substr($1, 7), "\r\t\t", sprintf("%.f", ($2 * 4096) / 2^20)}';
    sysctl vm.swapusage
}
