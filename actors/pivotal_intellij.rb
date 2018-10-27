require 'rainbow'
using Rainbow

class PivotalIntellij

  @@workspace_dir = '~/workspace'

  def PivotalIntellij.do(path)
    good_result = true

    exit unless ready_for_prefs?

    Dir.chdir(File.expand_path '~/workspace') do
      unless File.exist? 'pivotal_ide_prefs'
        good_result = system 'git clone https://github.com/pivotal-legacy/pivotal_ide_prefs'
        exit unless good_result
      end
      Dir.chdir('pivotal_ide_prefs') do
        puts Rainbow('Installing Pivotal IDE Prefs').green
        good_result = system 'cli/bin/ide_prefs install --ide=rubymine'
        exit unless good_result
        good_result = system 'cli/bin/ide_prefs install --ide=intellijcommunity'
        exit unless good_result
      end
    end

    return true
  end

  def PivotalIntellij.ready_for_prefs?
    rubymine_missing = Dir.glob(File.expand_path('~/Library/Preferences/RubyMine*/')).empty?
    puts Rainbow('Please run Rubymine once before continuing').red if rubymine_missing

    intellijcommunity_missing = Dir.glob(File.expand_path('~/Library/Preferences/IdeaIC*/')).empty?
    puts Rainbow('Please run IntelliJ CE once before continuing').red if intellijcommunity_missing

    !(rubymine_missing or intellijcommunity_missing)
  end
end
