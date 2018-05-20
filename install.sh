#!/bin/bash

set -e

# bash_colors so that out is easier to read
source ./install/bash_colors.sh

# base development
source ./install/workspace_dir.sh
source ./install/xcode.sh

# install brew and its packages
source ./install_brew.sh
# source ./brew-bundle.sh

# bash-it / terminal
# source ./setup-bash-it.sh
# source ./setup-custom-bash-it-plugins.sh

# git setup
# source ./setup-git-config.sh
# source ./setup-git-duet.sh

# ruby setup
# source ./setup-ruby.sh
# source ./setup-rubymine.sh
# source ./install-bundler.sh

clr_bold clr_green "Workstation Complete"
