require 'rainbow'
using Rainbow

class QSInterfaceYosemite

  def QSInterfaceYosemite.do

    Rainbow("Installing Quicksilver 'Yosemite' interface")
    Dir.chdir File.join(Dir.home, 'Downloads') do
      system "curl -L https://github.com/mikker/YosemiteInterface-qsplugin/releases/download/v1.0.3/Yosemite-1.0.3.qsplugin.zip"
      system "unzip Yosemite-1.0.3.qsplugin.zip"
      system "open Yosemite.qsplugin"
    end
end
