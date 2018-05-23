#!/bin/bash

set -e
source assets/bash_colors_ext.sh

function install_homebrew {
  if ! which brew > /dev/null ; then
    clr_green "Installing Homebrew"
    mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
  else
    clr_yellow "Homebrew dectected; moving on"
	fi
}

function symlink_brewfile {
  brewfile="${PWD}/assets/Brewfile"
  brewfile_link="${HOME}/.Brewfile"

  if [ ! -L "${brewfile_link}" ]; then
    clr_green "Creating Brewfile symlink"
    ln -s "${brewfile}" "${brewfile_link}"
  else
    clr_yellow "Brewfile symlink present, moving on"
  fi

}

function update_and_install_all_from_brewfile {
  clr_green "Updating Brew & installing everything from Brewfile"
  brew update
  brew tap Homebrew/bundle
  brew bundle --global
  brew cleanup
}

install_homebrew
symlink_brewfile
update_and_install_all_from_brewfile
