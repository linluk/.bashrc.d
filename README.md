# IMPORTANT NOTE!

repository moved to [Codeberg.org](https://codeberg.org/linluk/.bashrc.d)

## Why?

I want to test [Codeberg.org](https://codeberg.org), a european (germany) hosted Github-like infrastructure.

------

------

------

------

------

------

------

------

------

------

------

------

------

------

------

------

------

------

# Here lives my Bash-Config

My `~/.bashrc`'s only task is to source the `*.sh` files in this directory.

It does it like that:

```sh
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# source *.sh files from ~/.bashrc.d/
# files are named starting with 2-digit numbers
# so they should be sourced in the correct order
if [ -d ~/.bashrc.d/ ]; then
    for file in ~/.bashrc.d/*.sh; do
        [ -r "$file" ] && . "$file"
        # echo $file
    done
    unset file
fi
```

# How to use

Add the above code to your `.bashrc` (or replace it with it) and clone this repository to `~/.bashrc.d`:

```sh
cd ~/
git clone --depth 1 git@github.com:linluk/.bashrc.d.git
```

# What it does

Please read the source code! Some of it has comments, some is self-explanatory, some is quite crappy, some things might work, some things might not, ...

# License

All content of this repository is licensed under WTFPL.

```plain
            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                    Version 2, December 2004

 Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>

 Everyone is permitted to copy and distribute verbatim or modified
 copies of this license document, and changing it is allowed as long
 as the name is changed.

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

  0. You just DO WHAT THE FUCK YOU WANT TO.
```

Visit: [wtfpl.net](https://www.wtfpl.net/) for more details.
