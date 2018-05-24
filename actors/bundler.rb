require 'rainbow/refinement'
using Rainbow

class Bundler

  def Bundler.do

    if present?
      puts 'Bundler present, moving on'.yellow
      return true
    end

    puts 'Installing Bundler'.green
    good_result = system 'gem install bundler'
    return good_result

  end

  def Bundler.present?
    !`which bundle`.empty?
  end
end