require 'rainbow/refinement'
using Rainbow

class XcodeSierra

  def XcodeSierra.do

    if present?
      puts Rainbow('XCode present, moving on').yellow
      return true
    end

    good_result = system 'sudo xcodebuild -license'
    unless good_result
      puts Rainbow('XCode install had problems.').red
      return false
    end

    good_result = system 'xcode-select --install'
    unless good_result
      puts Rainbow('XCode install had problems.').red
      return false
    end

    puts Rainbow('XCode installed').green
    return true
  end

  def XcodeSierra.present?
    `xcode-select -p` == "/Library/Developer/CommandLineTools"
  end
end
