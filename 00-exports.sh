
# set PATH so it includes user's private Apps if it exists
if [ -d "$HOME/Apps" ] && [[ ":$PATH:" != *":$HOME/Apps:"* ]] ; then
    export PATH="$HOME/Apps:$PATH"
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

export EDITOR=$(which nvim)

