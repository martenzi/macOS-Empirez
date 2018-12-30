#!/usr/bin/env bash

main() {
    # First things first, asking for sudo credentials
    #ask_for_sudo
    # Installing Homebrew, the basis of anything and everything
    install_homebrew
    # Cloning Dotfiles repository for install_packages_with_brewfile
    # to have access to Brewfile
    clone_dotfiles_repo
    # Installing all packages in Dotfiles repository's Brewfile
    install_packages_with_brewfile
    # Changing default shell to Fish
    #change_shell_to_fish
    # Installing pip packages so that setup_symlinks can setup the symlinks
    install_pip_packages
    # Installing yarn packages
    #install_yarn_packages
    # Setting up symlinks so that setup_vim can install all plugins
    setup_symlinks
    # Setting up Vim
    setup_vim
    # Setting up tmux
    #setup_tmux
    # Configuring iTerm2
    configure_iterm2
    # Update /etc/hosts
    #update_hosts_file
    # Setting up macOS defaults
    #setup_macOS_defaults
    # Updating login items
    #update_login_items
}

DOTFILES_REPO=~/macOS-Empirez

function ask_for_sudo() {
    info "Prompting for sudo password"
    if sudo --validate; then
        # Keep-alive
        while true; do sudo --non-interactive true; \
            sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
        success "Sudo credentials updated"
    else
        error "Obtaining sudo credentials failed"
        exit 1
    fi
}

function install_homebrew() {
    info "Installing Homebrew"
    if hash brew 2>/dev/null; then
        success "Homebrew already exists"
    else
	#url=https://raw.githubusercontent.com/Sajjadhosn/dotfiles/master/installers/homebrew_installer
	#url=https://bitbucket.org/Martenzi/macos-empirez/src/master/homebrew_installer
	#url=https://raw.githubusercontent.com/martenzi/macOS-Empirez/master/homebrew_installer
	url=https://raw.githubusercontent.com/Homebrew/install/master/install
        if /usr/bin/ruby -e "$(curl -fsSL ${url})"; then
            success "Homebrew installation succeeded"
        else
            error "Homebrew installation failed"
            exit 1
        fi
    fi
}

function install_packages_with_brewfile() {
    BREW_FILE_PATH="${DOTFILES_REPO}/dotfilez/homebrew/z.brewfile"
    info "Installing packages within ${BREW_FILE_PATH}"
    if brew bundle check --file="$BREW_FILE_PATH" &> /dev/null; then
        success "Brewfile's dependencies are satisfied already"
    else
        if brew bundle --file="$BREW_FILE_PATH"; then
            success "Brewfile installation succeeded"
        else
            error "Brewfile installation failed"
            exit 1
        fi
    fi
}

function install_pip_packages() {
    pip_packages=(powerline-status requests flake8)
    info "Installing pip packages \"${pip_packages[*]}\""

    pip3_list_outcome=$(pip3 list)
    for package_to_install in "${pip_packages[@]}"
    do
        if echo "$pip3_list_outcome" | \
            grep --ignore-case "$package_to_install" &> /dev/null; then
            substep "${package_to_install} already exists"
        else
            if pip3 install "$package_to_install"; then
                substep "Package ${package_to_install} installation succeeded"
            else
                error "Package ${package_to_install} installation failed"
                exit 1
            fi
        fi
    done

    success "pip packages successfully installed"
}

function clone_dotfiles_repo() {
    info "Cloning dotfiles repository into ${DOTFILES_REPO}"
    if test -e $DOTFILES_REPO; then
        substep "${DOTFILES_REPO} already exists"
        pull_latest $DOTFILES_REPO
        success "Pull successful in ${DOTFILES_REPO} repository"
    else
        url=https://github.com/martenzi/macOS-Empirez.git
        if git clone "$url" $DOTFILES_REPO; then
            success "Cloned into ${DOTFILES_REPO}"
        else
            error "Cloning into ${DOTFILES_REPO} failed"
            exit 1
        fi
    fi
}

function pull_latest() {
    substep "Pulling latest changes in ${1} repository"
    if git -C $1 pull github master &> /dev/null; then
        return
    else
        error "Please pull the latest changes in ${1} repository manually"
    fi
}

function setup_vim() {
    info "Setting up vim"
    substep "Installing Vundle"
    if test -e ~/.vim/bundle/Vundle.vim; then
        substep "Vundle already exists"
        pull_latest ~/.vim/bundle/Vundle.vim
        substep "Pull successful in Vundle's repository"
    else
        url=https://github.com/VundleVim/Vundle.vim.git
        if git clone "$url" ~/.vim/bundle/Vundle.vim; then
            substep "Vundle installation succeeded"
        else
            error "Vundle installation failed"
            exit 1
        fi
    fi
    substep "Installing all plugins"
    if vim +PluginInstall +qall 2> /dev/null; then
        substep "Plugin installation succeeded"
    else
        error "Plugin installation failed"
        exit 1
    fi
    success "vim successfully setup"
}

function configure_iterm2() {
    info "Configuring iTerm2"
    if \
        defaults write com.googlecode.iterm2 \
            LoadPrefsFromCustomFolder -int 1 && \
        defaults write com.googlecode.iterm2 \
            PrefsCustomFolder -string "~/macOS-Empirez/plistz";
    then
        success "iTerm2 configuration succeeded"
    else
        error "iTerm2 configuration failed"
        exit 1
    fi
}

function setup_symlinks() {
    #POWERLINE_ROOT_REPO=/usr/local/lib/python3.7/site-packages
	
    info "Setting up symlinks"
    #symlink "powerline" \
    #    ${DOTFILES_REPO}/powerline \
    #    ${POWERLINE_ROOT_REPO}/powerline/config_files

	symlink ".bash_aliases" ${DOTFILES_REPO}/dotfilez/bash/.bash_aliases ~/.bash_aliases
	symlink ".bash_completion" ${DOTFILES_REPO}/dotfilez/bash/.bash_completion ~/.bash_completion
	symlink ".bash_env" ${DOTFILES_REPO}/dotfilez/bash/.bash_env ~/.bash_env
	symlink ".bash_grep" ${DOTFILES_REPO}/dotfilez/bash/.bash_grep ~/.bash_grep
	symlink ".bash_nvm" ${DOTFILES_REPO}/dotfilez/bash/.bash_nvm ~/.bash_nvm
	symlink ".bash_path" ${DOTFILES_REPO}/dotfilez/bash/.bash_path ~/.bash_path
	symlink ".bash_profile" ${DOTFILES_REPO}/dotfilez/bash/.bash_profile ~/.bash_profile
	symlink ".bash_prompt" ${DOTFILES_REPO}/dotfilez/bash/.bash_prompt ~/.bash_prompt
	symlink ".bashrc" ${DOTFILES_REPO}/dotfilez/bash/.bashrc ~/.bashrc
	symlink ".hushlogin" ${DOTFILES_REPO}/dotfilez/bash/.hushlogin ~/.hushlogin
	symlink ".iterm2_shell_integration.bash" ${DOTFILES_REPO}/dotfilez/bash/.iterm2_shell_integration.bash ~/.iterm2_shell_integration.bash
	success "Symlinks successfully setup"
	
#  ## ## ## ## ## My "Spectacle" Attempt ## ## ## ## ## ## ## ## ##
#    SPECTACLE_DEST_PATH=~/Library/Application Support/Spectacle
#    #symlink "spectacle" \
#    # the above line should be commented out and used instead of the "cp" below
#    # when Spectacle fixes the sorting issue of Shortcuts.json file
#	--> My idea here is to force create a dir if none exist (if app have not been opened yet)
#	--> I´m unfamiliar with the syntax and functionality - this is merely a copy/paste attempt based on deduction
#	if test ! -e ~/Library/Application Support/Spectacle; then
#        substep "Creating ${SPECTACLE_DEST_PATH}"
#        mkdir -p "$SPECTACLE_DEST_PATH"
#    fi
#    cp \
#       ${DOTFILES_REPO}/appz/Shortcuts.json \
#       ~/Library/Application\ Support/Spectacle/Shortcuts.json
 ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ##
}

function symlink() {
    application=$1
    point_to=$2
    destination=$3
    destination_dir=$(dirname "$destination")

    if test ! -e "$destination_dir"; then
        substep "Creating ${destination_dir}"
        mkdir -p "$destination_dir"
    fi
    if rm -rf "$destination" && ln -s "$point_to" "$destination"; then
        substep "Symlinking ${application} done"
    else
        error "Symlinking ${application} failed"
        exit 1
    fi
}

# function update_hosts_file() {
#     info "Updating /etc/hosts"
#     own_hosts_file_path=${DOTFILES_REPO}/hosts/own_hosts_file
#     ignored_keywords_path=${DOTFILES_REPO}/hosts/ignored_keywords
#     downloaded_hosts_file_path=/etc/downloaded_hosts_file
#     downloaded_updated_hosts_file_path=/etc/downloaded_updated_hosts_file
# 
#     if sudo cp "${own_hosts_file_path}" /etc/hosts; then
#         substep "Copying ${own_hosts_file_path} to /etc/hosts succeeded"
#     else
#         error "Copying ${own_hosts_file_path} to /etc/hosts failed"
#         exit 1
#     fi
# 
#     if sudo wget --quiet --output-document="${downloaded_hosts_file_path}" \
#         https://someonewhocares.org/hosts/hosts; then
#         substep "hosts file downloaded successfully"
# 
#         if ack --invert-match "$(cat ${ignored_keywords_path})" "${downloaded_hosts_file_path}" | \
#             sudo tee "${downloaded_updated_hosts_file_path}" > /dev/null; then
#             substep "Ignored patterns successfully removed from downloaded hosts file"
#         else
#             error "Failed to remove ignored patterns from downloaded hosts file"
#             exit 1
#         fi
# 
#         if cat "${downloaded_updated_hosts_file_path}" | \
#             sudo tee -a /etc/hosts > /dev/null; then
#             success "/etc/hosts updated"
#         else
#             error "Failed to update /etc/hosts"
#             exit 1
#         fi
# 
#     else
#         error "Failed to download hosts file"
#         exit 1
#     fi
# }

# function setup_macOS_defaults() {
#     info "Updating macOS defaults"
# 
#     current_dir=$(pwd)
#     cd ${DOTFILES_REPO}/appz
#     if martenzi-defaults-write.sh; then
#         cd $current_dir
#         success "macOS defaults setup succeeded"
#     else
#         cd $current_dir
#         error "macOS defaults setup failed"
#         exit 1
#     fi
# }

function info() {
    coloredEcho "$1" blue "========>"
}

function coloredEcho() {
    local exp="$1";
    local color="$2";
    local arrow="$3";
    if ! [[ $color =~ '^[0-9]$' ]] ; then
       case $(echo $color | tr '[:upper:]' '[:lower:]') in
        black) color=0 ;;
        red) color=1 ;;
        green) color=2 ;;
        yellow) color=3 ;;
        blue) color=4 ;;
        magenta) color=5 ;;
        cyan) color=6 ;;
        white|*) color=7 ;; # white or invalid color
       esac
    fi
    tput bold;
    tput setaf "$color";
    echo "$arrow $exp";
    tput sgr0;
}

function substep() {
    coloredEcho "$1" magenta "===="
}

function success() {
    coloredEcho "$1" green "========>"
}

function error() {
    coloredEcho "$1" red "========>"
}

main "$@"