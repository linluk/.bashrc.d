#!/bin/bash

function _check_repos() {
    #IFS=$'\n'
    if [ -f ~/.repos ]; then
        # have to escape $ with $$
        # have to escape # with \#
        repos=$(grep --color=never -vE '^\s*\#|^\s*$$' ~/.repos)
        # echo "[DEBUG] in 'if [ -f ~./repos ]'; \$repos is \"$repos\""
        OLD_WD=$(pwd)
        for repo in $repos; do
            repo=$(eval echo $repo | xargs)
            # echo "[DEBUG] in 'for repo in \$repos; do', \$repo is \"$repo\""
            if [ -d "$repo" ]; then
                #echo -e "\n\n------------------------------------------\nchecking: $repo\n\n"
                echo "checking: $repo"
                cd "$repo"
                git status
                #echo "git status returned: $?"  always 0
                #(IFS=$'\n'; for line in $(cd "$repo" && git status); do echo $line; done)
            else
                echo "\"$repo\" not found or no directory (tipp: check ~/.repos)"
            fi
        done
        cd "$OLD_WD"
    else
        echo "~/.repos not found or no file"
    fi
}

#
# (IFS=$'\n'; for line in $(cd "$HOME/.config/nvim" && git status); do echo $line; done)
#

_check_repos
