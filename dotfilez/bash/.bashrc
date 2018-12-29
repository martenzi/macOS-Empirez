#!/bin/env bash
#   ~/.bashrc
#
# Bash Shell initialization script. That's functions, aliases, bash-only variables
#
#   Henrik Mårtenzon
#       ~Martenzi

echo "*** .bashrc"

test -f ~/dotfiles/bash/.bash_path && source ~/dotfiles/bash/.bash_path
test -f ~/dotfiles/bash/.bash_env && source ~/dotfiles/bash/.bash_env
test -f ~/dotfiles/bash/.bash_aliases && source ~/dotfiles/bash/.bash_aliases
test -f ~/dotfiles/bash/.bash_completion && source ~/dotfiles/bash/.bash_completion
test -f ~/dotfiles/bash/.bash_prompt && source ~/dotfiles/bash/.bash_prompt

# Sourcing iTerm2´s Shell Integration config
# https://www.iterm2.com/documentation-shell-integration.html
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


#-------------------------#
# SHELL - INITIALIZATION  #
#-------------------------#
# [[ $PATH = *local/bin* ]] || PATH=$PATH:/usr/local/bin
# [[ $- = *i* ]] || return


#-------------------------#
# MACOS TWEAKS - TERMINAL #
#-------------------------#

# Keep Track of Defaults Write Commands Used in Mac OS X Automatically
#PROMPT_COMMAND='echo "$(history 1 | grep "defaults write")" | sed '/^$/d' >> ~/Desktop/bash_history_of_default_writes.txt'

[[ -f /etc/bash_completion ]] && \
   source /etc/bash_completion
[[ -f ~/.share/git-svn-extensions/source.sh ]] && \
   source ~/.share/git-svn-extensions/source.sh

# # Subshell to avoid triggering DEBUG.
# PROMPT_COMMAND='(history -a)'
# source /Users/martenzi/perl5/perlbrew/etc/bashrc

