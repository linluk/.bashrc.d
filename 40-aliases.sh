#
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
fi


alias ..='cd ..'
alias ....='cd ../..'
alias ......='cd ../../..'

alias lla='lsd -lha --color=always'

# some more ls aliases
alias ll='lsd -l --color=always'
alias la='ls -A'
#alias l='ls -CF'

alias xclip='xclip -selection clipboard'

alias mkcd='_mkdir_cd'

alias luamake="/home/linluk/.config/nvim/tools/lua-language-server/3rd/luamake/luamake"

# alias ll-watch=':() { clear && ll && echo -ne "Watching: $(pwd)\nPress Ctrl-C to exit"; sleep 2; :; }; :'
# alias watch='_watch_bash'
#alias watch='watch --color bash -c '\''source ~/.bashrc && '"'"''

alias yt2ogg='yt-dlp -x --audio-format vorbis --audio-quality 0 -o "%(title)s"'

alias print-lz='lpr -U "lu.singer" -P "LZ-Kopierer" -o CNTrustPrint=True'

alias tmux="_tmux"

alias man='_man_with_colors'
