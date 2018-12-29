#!/bin/sh bash
#   ~/.bash_profile
#
# POSIX Shell login script.
#
#   Henrik Mårtenzon
#       ~Martenzi

echo "*** .bash_profile"

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# set EDITOR to SublimeText3
export EDITOR="/Applications/BBedit"

# this is the root folder where all globally installed node packages will  go
export NPM_PACKAGES="/usr/local/npm_packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

# Here’s an example of how you can include (or actually “source” or execute) all files in a folder:
# for DOTFILE in 'find $HOME/dotfiles/bash'

# do
# [ -f '$DOTFILE' ] && source '$DOTFILE'
# done

# Set LSCOLORS
# eval "$(dircolors "$HOME/dotfiles/bash"/system/.dir_colors)"


# Test if bash files exists in HOME and source them

test -f ~/Config/dotfiles/bash/.bashrc && source ~/Config/dotfiles/bash/.bashrc

