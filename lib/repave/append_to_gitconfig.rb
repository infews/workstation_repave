# - Creates a .gitconfig in ~
# - appends an [include] directive to pull in the assets/gitinclude file
# This is due to a limitation in how .gitconfig is parsed (it can't be symlink, it seems)

require 'fileutils'
require 'pathname'

module Repave
  class AppendToGitconfig
    include Task

    def run_task
      gitconfig_filepath = Pathname(File.join(Dir.home, ".gitconfig")).expand_path
      gitinclude_filepath = Pathname(File.join(__dir__, "..", "..", "assets", "gitinclude")).expand_path

      unless File.exist?(gitconfig_filepath)
        puts info_message("Creating an empty .gitconfig")
        FileUtils.touch(gitconfig_filepath)
      end

      if File.open(gitconfig_filepath).grep(gitinclude_filepath).length > 0
        puts success_message("Git include directive already present in #{gitconfig_filepath}")
        return
      end

      puts info_message("Adding include directive to .gitconfig.")

      File.open gitconfig_filepath, 'a' do |f|
        f.puts ""
        f.puts "[include]"
        f.puts "    path=#{gitinclude_filepath}"
      end
    end
  end
end
