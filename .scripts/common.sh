
# ----------- svn shortcuts ------------
svndiff () { svn di $1 | vim -; }
st () { svn st $*; }
stm () { svn st $* |grep ^M } 
# -------------------------------------

# ----------- git shortcuts ------------
gitdiff () { git diff $1 | vim -; }
gst () { git status $*; }
# -------------------------------------

pwc () { perl -wc $*; }
rdo () { for file in `ls -1`; do $* $file; done; }
md5dir () { cd $1; find ./ -type f -print0 | xargs -0 md5sum | md5sum; cd - 1>&-;  } 
sc () { 
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


