require 'rainbow/refinement'
using Rainbow

class RubyInstall

  @@installer = '~/Downloads/Command Line Tools (macOS Sierra version 10.12).pkg'

  def RubyInstall.do

    @@ruby_version = '2.5.1'

    if present?
      puts "Ruby #{@@ruby_version} present, moving on".yellow
      return true
    end

    puts "Installing Ruby #{@@ruby_version}".green
    good_result = system "ruby-install ruby #{@@ruby_version}"

    unless good_result
      puts "Error installing Ruby".red
      return false
    end

    puts 'Writing '.green + '~/ruby-version'
    File.open(File.join(Dir.home, '.ruby-version'), 'w') do |file|
      "ruby-#{@@ruby_version}"
    end
  end

  def RubyInstall.present?
    File.exists? File.join(Dir.home, '.rubies', "ruby-#{@@ruby_version}")
  end
end
