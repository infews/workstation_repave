require 'rainbow'
using Rainbow

class SudoUpFront
  def SudoUpFront.do
    puts Rainbow("Running ").mediumpurple + "sudo " + Rainbow("early so shell has permissions").mediumpurple
    return system "sudo -v"
  end
end
