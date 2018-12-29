#!/bin/env bash
#   ~/.bash_aliases
#
# POSIX Shell login script. you should put all your environment variables in there. Like LESS, PATH, MANPATH, LC_*
#
#   Henrik Mårtenzon
#       ~Martenzi

echo "*** .alias"

#-------------------------#
# ALIASSES - FILESYSTEM   #
#-------------------------#
alias tree="tree -F --dirsfirst"
if ls --color >/dev/null 2>/dev/null; then
    alias ls="ls -bFk --color=auto"
else
    alias ls="ls -bFkG"
fi
alias ll="ls -lh"
alias l=" ll -a"
alias dff="nice df -h"
alias show='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hide='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'


#   -----------------------------
#   2.  MAKE TERMINAL BETTER
#   -----------------------------
# alias copy='cp -iv'                                   # Preferred 'cp' implementation
# alias move='mv -iv'                                   # Preferred 'mv' implementation
# alias newfolder='mkdir -pv'                       # Preferred 'mkdir' implementation
# alias list='ls -FGlAhp'                               # Preferred 'ls' implementation
# alias less='less -FSRXc'                          # Preferred 'less' implementation
# #cd() { builtin cd "$@"; ll; }                    # Always list directory contents upon 'cd'
# alias cd..='cd ../'                               # Go back 1 directory level (for fast typers)
# alias ..='cd ../'                                 # Go back 1 directory level
# alias ...='cd ../../'                             # Go back 2 directory levels
# alias .3='cd ../../../'

#               # Go back 3 directory levels
# alias .4='cd ../../../../'                        # Go back 4 directory levels
# alias .5='cd ../../../../../'                     # Go back 5 directory levels
# alias .6='cd ../../../../../../'                  # Go back 6 directory levels
# # alias edit='subl' -w                                # edit:         Opens any file in sublime editor
# alias f='open -a Finder ./'                       # f:            Opens current directory in MacOS Finder
# alias pf='sudo open -na Path Finder ./'
# alias .home='cd ~'                                    # .home:            Go Home
alias cl='clear'                                    # c:            Clear terminal display
alias binaries='type -all'                          # which:        Find executables
alias listpaths='echo -e ${PATH//:/\\n}'                # path:         Echo all executable Paths
alias basho='shopt'                             # Show_options: display bash options settings
alias resetTerm='stty sane'                     # fix_stty:     Restore terminal settings when screwed up
alias taboff='set completion-ignore-case On'        # cic:          Make tab-completion case-insensitive
#mkdir () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }         # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }        # ql:           Opens any file in MacOS Quicklook Preview
alias godsent='tee ~/Desktop/terminalOut.txt'       # DT:           Pipe content to file on MacOS Desktop
#   lr:  Full Recursive Directory Listing
#   ------------------------------------------

#-------------------------#
# ALIASSES - APPLICATIONS #
#-------------------------#
alias brewall='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
alias bare='/usr/bin/git --git-dir=$HOME/.home_config/ --work-tree=$HOME'
# alias edit
#alias cal="cal -m -3"
# alias gsh="git stash"
# alias gst="git status --short --branch"
# alias gsu="git submodule update --recursive --merge"
# alias gdf="git diff"
# alias gdt="git difftool"
# alias glo="git log"
# alias gps="git push"
# alias gpl="git pull"
# alias gco="git checkout"
# alias gci="git commit"
# alias gad="git add"
# alias grm="git rm"
# alias gmv="git mv"
# alias gtg="git tag"
# alias gbr="git branch"
# alias gs="git svn"