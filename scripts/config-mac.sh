#!/bin/bash -eux

AUTOHIDE_DELAY=0.0
AUTOHIDE_TIME=0.5

EXPOSE_DURATION=0.1

defaults write com.apple.dock autohide -bool true 
defaults write com.apple.dock autohide-delay -float "$AUTOHIDE_DELAY" 
defaults write com.apple.dock autohide-time-modifier -float "$AUTOHIDE_TIME" 

defaults write com.apple.dock missioncontrol-animation-duration -float 0.0

defaults write com.apple.dock expose-animation-duration -float "$EXPOSE_DURATION"

killall Dock

