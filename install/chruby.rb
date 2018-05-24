require 'rainbow/refinement'
using Rainbow

class ChrubyViaCurl

  @@version = '0.3.9'
  @@name = "chruby-#{@@version}"
  @@tarfile = "#{@@name}.tar.gz"
  @@good_result = true

  def ChrubyViaCurl.do
    if present?
      puts 'Chruby present, moving on'.yellow
      return true
    end

    Dir.chdir File.join(Dir.home, 'Downloads') do
      `curl -L https://github.com/postmodern/chruby/archive/v#{@@version}.tar.gz > #{@@tarfile}`
      `tar -xzvf #{@@tarfile}`
      Dir.chdir @@name do
        @@good_result = system 'sudo make install'
      end
    end

    if @@good_result
      return true
    end

    puts 'chruby install problem'.red
    return false
  end

  def ChrubyViaCurl.present?
    File.exists? '/usr/local/share/chruby'
  end
end

=begin
wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
tar -xzvf chruby-0.3.9.tar.gz
cd chruby-0.3.9/
sudo make install
=end
