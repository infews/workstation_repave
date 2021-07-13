# - Downloads and installs the Quicksilver Yosemite UI plugin
module Repave
  class QuicksilverYosemite
    include Task

    def run_task
      puts info_message("Installing Quicksilver 'Yosemite' interface")

      Dir.chdir File.join(Dir.home, 'Downloads') do
        system "curl -LO https://github.com/mikker/YosemiteInterface-qsplugin/releases/download/v1.0.3/Yosemite-1.0.3.qsplugin.zip"
        system "unzip Yosemite-1.0.3.qsplugin"
        system "open Yosemite.qsplugin"
      end
    end
  end
end
