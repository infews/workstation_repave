require 'rainbow/refinement'
using Rainbow

class WorkspaceDir

  @@workspace_dir = '~/workspace'

  def WorkspaceDir.do
    if File.exists? File.join(Dir.home, 'workspace')
      puts @@workspace_dir + " present, moving on".yellow
    else
      puts "Creating ".mediumpurple + @@workspace_dir + " directory".mediumpurple
      Dir.mkdir(File.join(Dir.home, 'workspace'))
    end
  end
end
