require 'rainbow/refinement'
using Rainbow

class Homebrew

  @@workspace_dir = '~/workspace'
  @@brewfile = File.join Dir.pwd, 'assets', 'Brewfile'
  @@brewfile_link = File.join Dir.home, '.Brewfile'

  def Homebrew.do
    if present?
      puts "Homebrew present, moving on".yellow
    else
      puts 'Installing Homebrew'.green
      Dir.mkdir 'homebrew'
      Dir.chdir 'homebrew' do
        `curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew`
      end
    end

    if File.exists? @@brewfile_link
      puts 'Brewfile symlink present, moving on'.yellow
    else
      puts 'Creating Brewfile symlink'.green
      `ln -s #{@@brewfile} #{@@brewfile_link}`
    end

    return true
  end

  def Homebrew.present?
    !`which brew`.empty?
  end

  def Homebrew.setup
    puts 'Updating Homebrew'.green
    `brew update`
    puts 'Running '.green + 'brew bundle ' + 'including casks & Mac App Store'.green
    `brew tap Homebrew/bundle`
    `brew bundle --global`
    puts 'Running '.green + 'brew cleanup'
    `brew cleanup`
    return true
  end

end
