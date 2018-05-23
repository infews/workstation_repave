require 'rainbow/refinement'
using Rainbow

class SudoUpFront
  def SudoUpFront.do
    puts "Running ".mediumpurple + "sudo " +"early so shell has permissions".mediumpurple
    system "sudo -v"
  end
end
