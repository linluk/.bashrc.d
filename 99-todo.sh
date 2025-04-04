#!/bin/bash

# THIS IS A LITTLE TODO-TOOL
# Commands:
#     todo-show
#     todo-add
#     todo-edit
#     todo-done

function todo-show() {
    if [ -f ~/.todo/todo.md ]; then
        # -E   extended regular expression
        # -n   quiet mode
        sed -nE '/^- \[ \]/s/^- \[ \]/[ ]/p' ~/.todo/todo.md
    fi
}

function todo-add() {
    mkdir -p ~/.todo
    echo "- [ ] ($(date +"%Y-%m-%d %H:%M")) $*" >> ~/.todo/todo.md
}

function todo-edit() {
    mkdir -p ~/.todo
    $EDITOR ~/.todo/todo.md
}

function todo-done() {
    local searchTerm="$*"
    local matches
    # IFS .. field seperator
    # grep:
    #   -n   linenumbers (seperated by ':')
    IFS=$'\n' read -d '' -r -a matches < <(grep --color=never -En "^- \[ \].*$searchTerm.*$" ~/.todo/todo.md; printf '\0')

    if [ ${#matches[@]} -eq 0 ]; then
        echo "No matching entries found."
        return
    fi

    for match in "${matches[@]}"; do
        local lineNumber=$(echo "$match" | cut -d: -f1)
        local content=$(echo "$match" | cut -d: -f2-)

        echo "$content"
        read -p "Set to Done? (y/N) " answer
        if [[ "$answer" =~ ^[Yy]$ ]]; then
            sed -i "${lineNumber}s/^\(- \[ \]\)/- [X]/" ~/.todo/todo.md
        fi
    done
}

# show todo list on startup
todo-show

