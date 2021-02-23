module Repave
  class AppendToGitconfig
    include Task

    def run_task
      gitconfig_filepath = File.expand_path(File.join("~", ".gitconfig"))
      gitinclude_filepath = File.expand_path(File.join(__dir__, "..", "..", "assets", "gitinclude"))

      if File.open(gitconfig_filepath).grep(gitinclude_filepath)
        puts success_message("Git include directive already present in #{gitconfig_filepath}")
        return
      end

      info_message("Adding include directive to .gitconfig.")

      File.open gitconfig_filepath, 'a' do |f|
        f.puts ""
        f.puts "[include]"
        f.puts "    path=#{gitinclude_filepath}"
      end
    end
  end
end
