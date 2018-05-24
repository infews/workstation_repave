require 'rainbow'
using Rainbow

class BashIt

  @@workspace_dir = '~/workspace'
  @@brewfile = File.join Dir.pwd, 'assets', 'Brewfile'
  @@brewfile_link = File.join Dir.home, '.Brewfile'

  def BashIt.do
    if present?
      puts "BashIt present, moving on".yellow
    else
      puts 'Installing BashIt'.green
      `git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it`
      `~/.bash_it/install.sh --silent`
		  `source ~/.bash_profile`
    end
    return true
  end

  def BashIt.present?
    File.exists? File.join(Dir.home, '.bash_it')
  end

  def BashIt.setup
    @@extentions = {
      'plugins' => ['fasd', 'history', 'chruby-auto'],
      'completion' => ['defaults', 'git', 'ssh'],
      'alias' => ['bundler', 'git']
    }

    @@extentions.each_key do |key|
      @@extentions[key].each do |name|
        enable key, name
      end
    end
  end

  def BashIt.enable(entity, name)
    entity_path = File.join(Dir.home, '.bash_it', entity)
    enabled_path = File.join(entity_path, 'enabled')
    available_path = File.join(entity_path, 'available')

    unless File.exists enabled_path
      Dir.mkdir enabled_path
    end

    Dir.chdir enabled_path do
      if File.exists? name
        puts name + Rainbow(" bash_it #{entity} already enabled, moving on").yellow
      elsif !File.exists? File.join(available_path, name, '.bash')
        puts Rainbow("bash_it #{entity} ").red + name + Rainbow('not available'.red)
      else
        puts Rainbow("Enabling bash_it #{entity} ").green + name
        `ln -s available/#{name}.bash`
      end
    end
  end
end
