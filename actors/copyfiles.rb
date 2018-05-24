require 'rainbow/refinement'
using Rainbow

class CopyFilesToHome

  @@installer = '~/Downloads/Command Line Tools (macOS Sierra version 10.12).pkg'

  def CopyFilesToHome.do

    @@home_files = ['.slate']

    puts 'Copying files to homedir'.mediumpurple

    @@home_files.each do |file|
      if File.exists? File.join(Dir.home, file)
        puts file + ' already exists, moving on'.yellow
      else
        puts 'Copying '.green + file + ' to ~/'.green
        FileUtils.copy_file(File.join('assets', file), File.join(Dir.home, file))
      end
    end

    return true
  end
end
