require 'rainbow'
using Rainbow
require 'fileutils'

class CopyFilesToHome

  @@installer = '~/Downloads/Command Line Tools (macOS Sierra version 10.12).pkg'

  def CopyFilesToHome.do

    @@home_files = ['.slate']

    puts Rainbow('Copying files to homedir').green

    @@home_files.each do |file|
      if File.exists? File.join(Dir.home, file)
        puts file + Rainbow(' already exists, moving on').yellow
      else
        puts Rainbow('Copying ').green + file + Rainbow(' to ~/').green
        FileUtils.copy_file(File.join('assets', file), File.join(Dir.home, file))
      end
    end

    return true
  end
end
