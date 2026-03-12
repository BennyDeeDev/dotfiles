#!/bin/bash

set -e

DOTFILES="$HOME/Repos/dotfiles"

# Accessibility
sudo defaults write com.apple.universalaccess reduceMotion -bool true

# Appearance
defaults write NSGlobalDomain AppleInterfaceStyleSwitchesAutomatically -bool true

# Keyboard
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Mouse
defaults write NSGlobalDomain com.apple.mouse.scaling -float 0.875
defaults write NSGlobalDomain com.apple.mouse.linear -bool true
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 39
defaults write com.apple.dock persistent-apps -array

# Mission Control
defaults write com.apple.dock mru-spaces -bool false

# Window Manager
defaults write com.apple.WindowManager EnableTiledWindowMargins -bool false
defaults write com.apple.WindowManager HideDesktop -bool true
defaults write com.apple.WindowManager StandardHideWidgets -bool true
defaults write com.apple.WindowManager StageManagerHideWidgets -bool true

# Finder - General
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder FinderSpawnTab -bool false
defaults write com.apple.finder NewWindowTarget -string "PfHm"

# Finder - Sidebar
defaults write com.apple.finder ShowRecentTags -bool false

# Finder - Advanced
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

# Clock
defaults write com.apple.menuextra.clock ShowAMPM -bool true
defaults write com.apple.menuextra.clock ShowDate -bool false
defaults write com.apple.menuextra.clock ShowDayOfWeek -bool true

# Plist
defaults import com.apple.symbolichotkeys "$DOTFILES/plist/symbolichotkeys.plist"
defaults import eu.exelban.Stats "$DOTFILES/plist/stats.plist"

killall Dock
killall Finder
killall ControlCenter