#!/bin/bash

function _tmux_default_session() {
    local tmux_command=$(which tmux)
    if ! $tmux_command has-session -t "default" &> /dev/null; then
        # -s SESSIONNAME
        # -n WINDOWNAME
        # -d start the session in background
        $tmux_command new-session -s "default" -n "default" -d
        # split horizontal
        $tmux_command split-window -h -t "default:default"
        # split the right pane vertical
        $tmux_command split-window -v -t "default:default.1"
        # clear output (like my todo list) in top- and bottom-right panes
        $tmux_command send-keys -t "default:default.1" Space "clear" C-m  # Start with Space -> no command history!
        $tmux_command send-keys -t "default:default.2" Space "clear" C-m  # Start with Space -> no command history!
        # launch htop in top right pane
        $tmux_command send-keys -t "default:default.1" Space "htop" Space "--delay=60" Space "--user" C-m  # Start with Space -> no command history!
        # set sizes and select the left pane
        $tmux_command resize-pane -t "default:default.1" -U 7
        $tmux_command select-pane -t "default:default.0"
        $tmux_command resize-pane -R 35
    fi
}

function _tmux() {
    # tmux is an alias to this function _tmux
    # so we need to get the "real" tmux command
    local tmux_command=$(which tmux)
    #local tmux_args='-T clipboard,256,mouse,ccolour,cstyle'
    local tmux_args='-T clipboard,256,ccolour,cstyle'
    if [ -z "$*" ]; then
        _tmux_default_session
        echo $tmux_command $tmux_args attach-session -t "default"
        $tmux_command $tmux_args attach-session -t "default"
    else
        echo $tmux_command $tmux_args $*
        $tmux_command $tmux_args $*
    fi
}
