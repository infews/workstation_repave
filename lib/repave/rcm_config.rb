# - Assumes Homebrew installed rcm to manage the dotfiles in the assets dir
# - Appends the rcrc with the assets directory
# - Runs rcup to attach symlinks to ~
module Repave
  class RcmConfig
    include Task

    def run_task
      rcrc_filepath = File.join(DOTFILES_PATH, "rcrc")

      unless File.open(rcrc_filepath).grep("DOTFILES_DIRS")
        puts info_message('Updating .rcrc with its path')
        File.open rcrc_filepath, 'a' do |f|
          f.puts "DOTFILES_DIRS=#{DOTFILES_PATH}"
        end
      end

      puts info_message('Restarting RCM to manage current dotfiles')
      system "rcup -d #{DOTFILES_PATH}"
    end

  end
end
