BASH_UTILS_DIR="$HOME/bin/bash-utils"


#-- Show the git branch for the current folder
export PS1="\[\e[34;1m\]\[\033[01;34m\]\W\[\033[00m\]\[\e[0m\]:\[\e[35;1m\]\`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\\\\\*\ \(.+\)$/\(\\\\\\\\\1\)\/\`\[\033[0m\]$\[\033[0m\] "

#-- Add bash autocompletion to ssh commands
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e 's/,.*//g;s/.*\[\([^\]*\)].*/\1/' | uniq | grep -v "\["`;)" ssh

source "$BASH_UTILS_DIR/lib/git-completion.bash"
source "$BASH_UTILS_DIR/lib/z.sh"
