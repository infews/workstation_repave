# - Assumes Homebrew installed rcm to manage the dotfiles in the assets dir
# - Appends the rcrc with the assets directory
# - Runs rcup to attach symlinks to ~
module Repave
  class RcmConfig
    include Task

    def run_task
      rcrc_filepath = File.join(ASSET_PATH, 'rcrc')

      if File.open(rcrc_filepath).grep("DOTFILES_DIR")
        puts success_message("RCM is already managing your dotfiles. Moving on.")
        return
      end

      puts info_message('Updating .rcrc with its path')
      File.open rcrc_filepath, 'a' do |f|
        f.puts ""
        f.puts "DOTFILES_DIRS=#{ASSET_PATH}"
      end

      puts info_message('Configuring RCM to manage dotfiles')
      system "rcup -d #{ASSET_PATH}"
    end
  end
end
