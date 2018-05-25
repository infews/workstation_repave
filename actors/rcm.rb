require 'rainbow'
using Rainbow

class Rcm
  def Rcm.setup
    Rainbow('Setting up RCM to manage dotfiles in ').green + 'assets'
    system "rcup -d #{File.join, Dir.home, 'balboa_workspace/assets'}"
  end
end
