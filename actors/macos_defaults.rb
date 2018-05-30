require 'rainbow'
using Rainbow

class MacOsDefaults

  def MacOsDefaults.do(path)
      puts Rainbow('Setting various MacOS defaults').mediumpurple
      system "./assets/macos"
  end
end
