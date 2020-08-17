module Repave
  class SetSystemName
    include Task

    attr_reader :system_name

    def initialize
      @system_name_file = File.expand_path("~/.system_name")
      @system_name = File.open(@system_name_file).read
    end

    def go
      test(File.exist?(@system_name_file)) { "File ~/.system_name does not exist." }
      test(!system_name.empty?) { "File ~/.system_name does not include a name." }

      puts color_message("Setting system name to ", :cyan) + system_name

      system "sudo scutil --set ComputerName #{system_name}"
      system "sudo scutil --set HostName #{system_name}"
      system "sudo scutil --set LocalHostName #{system_name}"
      system "sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string #{system_name}"
    end
  end
end
