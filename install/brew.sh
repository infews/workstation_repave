#!/bin/bash

set -e
source assets/bash_colors_ext.sh

# Install brew
function install_brew {
  if ! which brew > /dev/null ; then
    clr_green "Installing Homebrew"
    mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
  else
    clr_yellow "Homebrew dectected; moving on"
	fi
}

install_brew
