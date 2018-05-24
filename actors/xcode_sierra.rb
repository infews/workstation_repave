require 'rainbow'
using Rainbow

class XcodeSierra

  @@installer = '~/Downloads/Command Line Tools (macOS Sierra version 10.12).pkg'

  def XcodeSierra.do

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

  def XcodeSierra.present?
    `xcode-select -p` =~ /Developer/
  end
end
