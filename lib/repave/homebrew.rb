# - Installs Homebrew the first time
# - Installs brew bundle
# - Runs brew bundle with the Brewfile in assets

module Repave
  class Homebrew
    include Task

    def homebrew_present?
      !`which brew`.empty?
    end

    def run_task
      homebrew_present? ? update : install
    end

    private

    def install
      puts info_message("Installing Homebrew.")
      system "/bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
      system 'eval "$(/opt/homebrew/bin/brew shellenv)" && brew update'
      # system "brew update"

      puts info_message("Running brew the first time; using ~/workspace/workstation_repave/assets/Brewfile")
      system "brew tap Homebrew/bundle"
      system 'export HOMEBREW_BUNDLE_FILE="${HOME}/workspace/workstation_repave/assets/Brewfile"'
      system "brew bundle --global"

      puts info_message("Running brew cleanup.")
      system "brew cleanup"
    end

    def update
      puts info_message("Homebrew present and connected to assets/Brewfile. Updating & Upgrading")
      system "brew update && brew upgrade && brew bundle"
    end
  end
end

