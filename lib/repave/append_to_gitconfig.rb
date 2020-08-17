module Repave
  class AppendToGitconfig
    include Task

    def initialize
      @gitconfig_filepath = File.expand_path("~/.gitconfig")
      @gitinclude_filepath = File.expand_path(File.join(__dir__, "..", "..", "assets", "gitinclude"))
    end

    def go

      if File.open(@gitconfig_filepath).grep(@gitinclude_filepath)
        puts color_message "Git include directive already present in #{@gitconfig_filepath}", :green
        return
      end

      File.open @gitconfig_filepath, 'a' do |gitconfig_file|
        gitconfig_file.puts ""
        gitconfig_file.puts "[include]"
        gitconfig_file.puts "    path=#{@gitinclude_filepath}"
      end

      puts color_message "Git include directive now in #{@gitconfig_filepath}", :green
    end
  end
end
