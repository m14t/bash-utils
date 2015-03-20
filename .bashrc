BASH_UTILS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#-- Colors
color_reset="\[\033[00m\]\[\e[0m\]"
color_bold_blue="\[\e[34;1m\]\[\033[01;34m\]"
color_bold_purple="\[\e[35;1m\]"
color_bold_yellow="\[\e[33;1m\]"

#-- Show the git branch for the current folder
function getGitPromptMessage {
    PROMPT=""
    MODIFIED=""
    BRANCH="$(git symbolic-ref HEAD 2>/dev/null)"
    BRANCH=${BRANCH##refs/heads/}

    if [ -n "$BRANCH" ]; then
        #-- Find out if we have any modifications
        git diff-index --quiet HEAD 2> /dev/null
        if [ 1 -eq $? ]; then
            MODIFIED="*"
        fi

        PROMPT="${PROMPT}(${BRANCH}${MODIFIED})"
    fi

    echo "${PROMPT}"
}
export PS1="${color_bold_blue}\W${color_reset}:${color_bold_purple}\$(getGitPromptMessage | sed -e 's/\*/${color_bold_yellow}*${color_bold_purple}/')${color_reset}$ "

#-- Add bash autocompletion to ssh commands
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e 's/,.*//g;s/.*\[\([^\]*\)].*/\1/' | uniq | grep -v "\["`;)" ssh

source "$BASH_UTILS_DIR/lib/git-completion.bash"
source "$BASH_UTILS_DIR/.bash_autocomplete"
source "$BASH_UTILS_DIR/lib/z.sh"
source "$BASH_UTILS_DIR/.cd.."
