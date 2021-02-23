module Repave
  class Homebrew
    include Task

    def homebrew_present?
      !`which brew`.empty?
    end

    def run_task
      if homebrew_present?
        puts success_message("Homebrew present and connected to Brewfile. You can run 'brew' as normal.")
        return
      end

      puts info_message("Installing Homebrew.")
      system '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
      system 'brew update'

      puts info_message("Running brew the first time; using ~/workspace/workstation_repaver/assets/Brewfile")
      system 'brew tap Homebrew/bundle'
      system 'brew bundle --global'
      system 'HOMEBREW_BUNDLE_FILE="${HOME}/workspace/workstation_repave/assets/Brewfile" brew bundle'

      puts info_message("Running brew cleanup.")
      system 'brew cleanup'
    end
  end
end

