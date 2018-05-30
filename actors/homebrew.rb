require 'rainbow'
using Rainbow

class Homebrew

  @@workspace_dir = '~/workspace'
  @@brewfile = File.join Dir.pwd, 'assets', 'Brewfile'
  @@brewfile_link = File.join Dir.home, '.Brewfile'

  def Homebrew.do(path)
    good_result = true

    if present?
      puts Rainbow("Homebrew present, moving on").yellow
    else
      puts Rainbow('Installing Homebrew').green
      good_result = system '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
    end
    
    exit unless good_result

    if File.exists? @@brewfile_link
      puts Rainbow('Brewfile symlink present, moving on').yellow
    else
      puts Rainbow('Creating Brewfile symlink').green
      `ln -s #{@@brewfile} #{@@brewfile_link}`
    end

    return true
  end

  def Homebrew.present?
    !`which brew`.empty?
  end

  def Homebrew.setup(path)
    puts Rainbow('Updating Homebrew').green
    system 'brew update'
    puts Rainbow('Running ').green + 'brew bundle ' + Rainbow('including casks & Mac App Store').green
    system 'brew tap Homebrew/bundle'
    system 'brew bundle --global'
    puts Rainbow('Running ').green + 'brew cleanup'
    system 'brew cleanup'
    return true
  end

end
