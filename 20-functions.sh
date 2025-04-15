#!/bin/bash

# aliased to mkcd in ~/.bashrc.d/[**]-aliases.sh
function _mkdir_cd() {
    mkdir -p "$1" && cd "$1" ;
}

# aliased to man in ~/.bashrc.d/[**]-aliases.sh
function _man_with_colors() {
    # https://www.geeksforgeeks.org/how-to-view-colored-man-pages-in-linux/
    export LESS_TERMCAP_mb=$'\e[01;31m'       # begin blinking
    export LESS_TERMCAP_md=$'\e[01;37m'       # begin bold
    export LESS_TERMCAP_me=$'\e[0m'           # end all mode like so, us, mb, md, mr
    export LESS_TERMCAP_se=$'\e[0m'           # end standout-mode
    export LESS_TERMCAP_so=$'\e[45;93m'       # start standout mode
    export LESS_TERMCAP_ue=$'\e[0m'           # end underline
    export LESS_TERMCAP_us=$'\e[4;93m'        # start underlining

    command man "$@"
}
