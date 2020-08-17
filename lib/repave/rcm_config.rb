module Repave
  class RcmConfig
    include Task

    def initialize
      @assets_filepath = File.expand_path(File.join(__dir__, "..", "..", "assets"))
      @rcrc_filepath = File.join(@assets_filepath, 'rcrc')
    end

    def go

      if File.open(@rcrc_filepath).grep("DOTFILES_DIR")
        puts color_message "RCM is already managing your dotfiles", :green
        return
      end

      File.open @rcrc_filepath, 'a' do |rcrc_file|
        rcrc_file.puts ""
        rcrc_file.puts "DOTFILES_DIRS=#{@assets_filepath}"
      end

      puts color_message 'Configuring RCM', :green
      system "rcup -d #{@assets_filepath}"
    end
  end
end
