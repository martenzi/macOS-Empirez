#!/bin/zsh
#   ~/.zshenv
#
# ZSH Shell environment script.
#
#   Henrik Mårtenzon
#       ~Martenzi

echo "*** now executing .zshenv"

#-------------------------#
# SHELL - PATHS           #
#-------------------------#


export PATH=/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Volumes/Mojave/Users/z/.oh-my-zsh

# Path to your ~ binaries
export PATH=~/Config/binaries:$PATH

# Path to your Homebrew binaries
export PATH=$PATH:/usr/local/Cellar

# Path to local and system binaries
export PATH=$PATH:/usr/local:usr/local/bin

# Path to EDITOR
# Had several issues with getting Subl to be recognized.
# export PATH="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl:$PATH"

# Path to MANPAHES
export MANPATH="/usr/local/man:$MANPATH"

# Path to SSH
#export SSH_KEY_PATH="~/.ssh/id_rsa_bitbucket.ssh.key"

# Path to ZSH plugin manager ZPLUG
#export ZPLUG_HOME=/usr/local/opt/zplug

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="/Applications/BBEdit.app/Contents/MacOS/BBEdit"
# else
#   export EDITOR='mvim'
# fi

#-------------------------#
# THEME - configuration   #
#-------------------------#

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="powerlevel9k/powerlevel9k"

# THEME OPTIONS for PowerLine9k

# Double-Lined Prompt

# By default, powerlevel9k is a single-lined prompt.
# If you would like to have the segments display on one line,
# and print the command prompt below it,
# simply define POWERLEVEL9K_PROMPT_ON_NEWLINE in your ~/.zshrc:
# POWERLEVEL9K_PROMPT_ON_NEWLINE=false

# If you want the right prompt to appear on the newline as well,
# simply define POWERLEVEL9K_RPROMPT_ON_NEWLINE as well in your ~/.zshrc:
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_RPROMPT_ON_NEWLINE=true

# You can customize the icons used to
# draw the multi-line prompt by setting the following variables in your ~/.zshrc:
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="↱"
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="↳ "

# Adding Newline After Prompt
# POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

# Disable Right Prompt
# POWERLEVEL9K_DISABLE_RPROMPT=true

# If you want to split your segments up between two lines,
# make use of the newline segment in segment list.
# For example:
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir newline vcs)

# Hide Martenzi@computer in terminal prompt
# DEFAULT_USER=`whoami`

# prompt_context() {
#     local seq
#     seq='%(!.{%F{yellow}%}.)%n'
#     if [[ "$USER" != "$DEFAULT_USER" ]]; then
#         seq="$seq@%m"
#     fi
#     prompt_segment black default $seq
# }

# Uncomment the following line to use case-sensitive completion.
 CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

#-------------------------#
# PLUGIN - configuration  #
#-------------------------#

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

# User configuration

# You may need to manually set your language environment
# export LANG=en_US.UTF-8



# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#-------------------------#
# SOURCE - configuration  #
#-------------------------#

# source /Volumes/SpaceX/Martenzi/dotfiles/zsh/.zshrc
# source ~/.oh-my-zsh/oh-my-zsh.sh
# source ~/.iterm2_shell_integration.zsh
# source $ZPLUG_HOME/init.zsh
