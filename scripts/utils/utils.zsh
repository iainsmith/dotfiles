function jcurl() {
    curl -s "$@" | jq .
}

# Find CPU and Memory Hogs
function cpuhogs() { ps wwaxr -o %cpu,pid,time,command | head -10 ;}
function memhogs() { ps wwaxm -o %mem,pid,time,command | head -10; }

# Extract all archives with a single command
function extract () {
  if [ $# -eq 1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)     echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
