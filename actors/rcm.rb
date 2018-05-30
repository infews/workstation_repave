require 'rainbow'
using Rainbow

class Rcm

  def Rcm.setup(path)
    puts Rainbow('Making ').green + '~/.gitconfig' + Rainbow(' that includes from this repo')

    File.open(File.join(Dir.home, '.gitconfig'), 'w') do |file|
      file << "[include]\n    path=#{File.join(path, 'assets', 'gitinclude')}\n"
    end

    puts Rainbow('Setting up RCM to manage dotfiles in ').green + 'assets'
      system "rcup -d #{File.join(path, 'assets')}"
  end
end
