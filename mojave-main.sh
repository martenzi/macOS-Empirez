#!/usr/bin/env bash

main() {
    # First things first, asking for sudo credentials
    ask_for_sudo
    # Installing Homebrew, the basis of anything and everything
    install_homebrew
    # Installing pip packages so that setup_symlinks can setup the symlinks
    install_pip_packages
    # Configuring iTerm2
    configure_iterm2
    # Update /etc/hosts
    update_hosts_file
    # Setting up macOS defaults
    setup_macOS_defaults
    # Updating login items
    update_login_items
}

DOTFILES_REPO=~/macOS-Empire/dotfiles

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
url=https://raw.githubusercontent.com/Sajjadhosn/dotfiles/master/installers/homebrew_installer
        if /usr/bin/ruby -e "$(curl -fsSL ${url})"; then
            success "Homebrew installation succeeded"
        else
            error "Homebrew installation failed"
            exit 1
        fi
    fi
}

function install_packages_with_brewfile() {
    BREW_FILE_PATH="${DOTFILES_REPO}/homebrew/z.brewfile"
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
#    pip_packages=(powerline-status requests flake8)
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

# function clone_dotfiles_repo() {
#     info "Cloning dotfiles repository into ${DOTFILES_REPO}"
#     if test -e $DOTFILES_REPO; then
#         substep "${DOTFILES_REPO} already exists"
#         pull_latest $DOTFILES_REPO
#         success "Pull successful in ${DOTFILES_REPO} repository"
#     else
#         url=https://bitbucket.org/Martenzi/macos-empire.git
#         if git clone "$url" $DOTFILES_REPO; then
#             success "Cloned into ${DOTFILES_REPO}"
#         else
#             error "Cloning into ${DOTFILES_REPO} failed"
#             exit 1
#         fi
#     fi
# }
# 
# function pull_latest() {
#     substep "Pulling latest changes in ${1} repository"
#     if git -C $1 pull origin master &> /dev/null; then
#         return
#     else
#         error "Please pull the latest changes in ${1} repository manually"
#     fi
# }

# function configure_iterm2() {
#     info "Configuring iTerm2"
#     if \
#         defaults write com.googlecode.iterm2 \
#             LoadPrefsFromCustomFolder -int 1 && \
#         defaults write com.googlecode.iterm2 \
#             PrefsCustomFolder -string "/Volumes/SpaceX/SpX---Configuration---HQ/Config---Plist-Database/Config---iTerm2---Plist/com.googlecode.iterm2.plist";
#     then
#         success "iTerm2 configuration succeeded"
#     else
#         error "iTerm2 configuration failed"
#         exit 1
#     fi
# }

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