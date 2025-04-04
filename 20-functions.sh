#!/bin/bash

# aliased to mkcd in ~/.bashrc.d/[**]-aliases.sh
function _mkdir_cd() {
    mkdir -p "$1" && cd "$1" ;
}

