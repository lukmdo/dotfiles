#!/usr/bin/env bash

set -euo pipefail

## BROWSER
# https://support.apple.com/en-gb/102362
# install defaultbrowser from brew/ports
defaultbrowser chrome

## SHORTCUTS/TEXT (DISABLE UNUSED/CONFLICTS)
# exported via
# defaults export pbs - | plutil -convert json -o - -  | jq --sort-keys > macos/defaults.pbs.json
plutil -convert xml1 -o - macos/defaults.pbs.json | defaults import pbs -
/System/Library/CoreServices/pbs -flush


# https://github.com/mathiasbynens/dotfiles/blob/master/.macos

# Set max keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Show the ~/Library folder
chflags nohidden ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Disable automatic emoji substitution (i.e. use plain text smileys)
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false
