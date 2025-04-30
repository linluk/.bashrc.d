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
                cd "$repo"
                if [ $? -ne 0 ]; then
                    echo "failed to enter: $repo"
                    continue;
                else
                    echo "checking: $repo"
                    git status --short
                    #echo "git status returned: $?"  always 0
                fi
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
