#!/bin/bash

set -e
source assets/bash_colors_ext.sh

function install_workspace_dir {
  if [[ ! -d ~/workspace ]]; then
    clr_green "Creating ~/workspace directory"
    mkdir ~/workspace
  else
    clr_yellow "~/workspace detected, moving on"
  fi
}

install_workspace_dir
