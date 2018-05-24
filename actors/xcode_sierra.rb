require 'rainbow/refinement'
using Rainbow

class Xcode

  @@installer = '~/Downloads/Command Line Tools (macOS Sierra version 10.12).pkg'

  def Xcode.do

    if present?
      puts 'XCode present, moving on'.yellow
      return true
    end

    if !File.exists? @@installer
      puts 'Please put '.yellow + 'Command Line Tools (macOS Sierra version 10.12).pkg ' + 'in '.yellow + '~/Downloads'
      return false
    end

    puts 'Installing XCode command line tools from ~/Downloads'.bright.mediumpurple
    good_result = system "open #{@@installer}"
    if good_result
      puts 'XCode installed'.green
      return true
    else
      puts 'XCode install had problems.'.red
      return false
    end
  end

  def Xcode.present?
    `xcode-select -p` =~ /Developer/
  end
end
