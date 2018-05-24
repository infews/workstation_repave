require 'rainbow'
using Rainbow

class WorkspaceDir

  @@workspace_dir = '~/workspace'

  def WorkspaceDir.do
    if File.exists? File.join(Dir.home, 'workspace')
      puts @@workspace_dir + Rainbow(" present, moving on").yellow
      return true
    end

    puts Rainbow("Creating ").mediumpurple + @@workspace_dir + Rainbow(" directory").mediumpurple
    Dir.mkdir File.join(Dir.home, 'workspace')
  end
end
