module Repave
  class PrepHomebrew
    include Task

    def homebrew_present?
      !`which brew`.empty?
    end

    def go
      if homebrew_present?
        puts color_message("Homebrew present and connected to Brewfile. You can run 'brew' as normal", :green)
        return
      end

      puts color_message("Installing Homebrew", :cyan)
      system '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'

      system 'brew update'
      puts color_message("Running brew the first time; using ~/workspace/workstation_repaver/assets/Brewfile", :cyan)
      system 'brew tap Homebrew/bundle'
      system 'brew bundle --global'
      system 'HOMEBREW_BUNDLE_FILE="${HOME}/workspace/workstation_repave/assets/Brewfile" brew bundle'

      puts color_message("Running brew cleanup", :cyan)
      system 'brew cleanup'
    end
  end
end

