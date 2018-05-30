require 'rainbow'
using Rainbow

class Bundler

  def Bundler.do(path)

    if present?
      puts Rainbow('Bundler present, moving on').yellow
      return true
    end

    puts Rainbow('Installing Bundler').green
    good_result = system 'gem install bundler'
    return good_result

  end

  def Bundler.present?
    !`which bundle`.empty?
  end
end
