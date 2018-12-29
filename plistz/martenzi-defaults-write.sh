#!/usr/bin/env bash


###############################################################################
# bot "Configuring General System UI/UX..."
###############################################################################
# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
# running "closing any system preferences to prevent issues with automated changes"
osascript -e 'tell application "System Preferences" to quit'
ok

# running "Show icons for hard drives, servers, and removable media on the desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true;

# running "Menu bar: disable transparency"
defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false;

# running "Set highlight color to green"
defaults write NSGlobalDomain AppleHighlightColor -string "0.764700 0.976500 0.568600";

# running "Set sidebar icon size to medium"
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2;

# running "Always show scrollbars"
defaults write NSGlobalDomain AppleShowScrollBars -string "Always";
# Possible values: `WhenScrolling`, `Automatic` and `Always`

# running "Expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true;

# running "Expand print panel by default"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true;

# running "Save to disk (not to iCloud) by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false;

# running "Set Help Viewer windows to non-floating mode"
defaults write com.apple.helpviewer DevMode -bool true;

# running "Disable smart quotes as they’re annoying when typing code"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false;

# running "Disable smart dashes as they’re annoying when typing code"
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false;

# running "Disable 'natural' (Lion-style) scrolling"
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false;

# running "Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3;

# running "Use scroll gesture with the Ctrl (^) modifier key to zoom"
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144;
# running "Follow the keyboard focus while zoomed in"
defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true;

# running "Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false;

# running "Save screenshots to the desktop"
defaults write com.apple.screencapture location -string "${HOME}/Desktop";

# running "Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)"
defaults write com.apple.screencapture type -string "png";

# running "Disable shadow in screenshots"
defaults write com.apple.screencapture disable-shadow -bool true;

# running "Disable window animations and Get Info animations"
defaults write com.apple.finder DisableAllAnimations -bool true;

# running "Set Desktop as the default location for new Finder windows"
# For other paths, use 'PfLo' and 'file:///full/path/here/'
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/";

# running "Show hidden files by default"
defaults write com.apple.finder AppleShowAllFiles -bool true;

# running "Show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true;

# running "Show status bar"
defaults write com.apple.finder ShowStatusBar -bool true;

# running "Show path bar"
defaults write com.apple.finder ShowPathbar -bool true;

# running "Display full POSIX path as Finder window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true;

# running "When performing a search, search the current folder by default"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf";

# running "Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false;

# running "Use list view in all Finder windows by default"
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv";

# running "Disable the warning before emptying the Trash"
defaults write com.apple.finder WarnOnEmptyTrash -bool false;

# running "Show the ~/Library folder"
chflags nohidden ~/Library;

# 
# running "Expand the following File Info panes: “General”, “Open with”, and “Sharing & Permissions”"
defaults write com.apple.finder FXInfoPanesExpanded -dict \
  General -bool true \
  OpenWith -bool true \
  Privileges -bool true;


# running "Change minimize/maximize window effect to scale"
defaults write com.apple.dock mineffect -string "scale";

# running "Minimize windows into their application’s icon"
defaults write com.apple.dock minimize-to-application -bool true;


# running "Show indicator lights for open applications in the Dock"
defaults write com.apple.dock show-process-indicators -bool true;

# running "Don’t animate opening applications from the Dock"
defaults write com.apple.dock launchanim -bool false;

# running "Don’t group windows by application in Mission Control"
# (i.e. use the old Exposé behavior instead)
defaults write com.apple.dock expose-group-by-app -bool false;

# running "Disable Dashboard"
defaults write com.apple.dashboard mcx-disabled -bool true;

# running "Don’t show Dashboard as a Space"
defaults write com.apple.dock dashboard-in-overlay -bool true;

# running "Don’t automatically rearrange Spaces based on most recent use"
defaults write com.apple.dock mru-spaces -bool false;

# running "Remove the auto-hiding Dock delay"
defaults write com.apple.dock autohide-delay -float 0;
# running "Remove the animation when hiding/showing the Dock"
defaults write com.apple.dock autohide-time-modifier -float 0;

# running "Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true;

# bot "Configuring Hot Corners"
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center

# running "Top left screen corner → Mission Control"
defaults write com.apple.dock wvous-tl-corner -int 2;
defaults write com.apple.dock wvous-tl-modifier -int 0;
# running "Top right screen corner → Desktop"
defaults write com.apple.dock wvous-tr-corner -int 4;
defaults write com.apple.dock wvous-tr-modifier -int 0;
# running "Bottom right screen corner → Start screen saver"
# defaults write com.apple.dock wvous-br-corner -int 5
# defaults write com.apple.dock wvous-br-modifier -int 0;

killall cfprefsd

###############################################################################
# Kill affected applications                                                  #
###############################################################################
for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
  "Dock" "Finder" "Mail" "Messages" "Safari" "SizeUp" "SystemUIServer" \
  "iCal" "Terminal"; do
  killall "${app}" > /dev/null 2>&1
done;