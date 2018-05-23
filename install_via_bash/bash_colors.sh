#!/bin/bash

set -e

function install_bash_colors {
  if [[ ! -f assets/.bash_colors ]]; then
    echo "Downloading bash_colors"
    curl https://raw.githubusercontent.com/mercuriev/bash_colors/master/bash_colors.sh > assets/.bash_colors
  else
    echo "bash_colors detected, moving on"
  fi
}

install_bash_colors
