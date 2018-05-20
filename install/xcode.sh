#!/bin/bash

set -e
source assets/bash_colors_ext.sh

# Install x-code and accept license manually
# We basically do this solely to get git
function install_xcode {
	if [[ ! $(xcode-select -p)=='/Library/Developer/CommandLineTools' ]]; then
	  clr_green "Installing XCode developer tools"
	  sudo xcodebuild -license
	  xcode-select --install
	else
	  clr_yellow "XCode detected, skipping install"
	fi
}
source assets/.bash_colors
install_xcode
