# - Sets the system name to the context of the file ~/.system_name
# - << You will need to populate this file for this to work >>
module Repave
  class SetSystemName
    include Task

    def run_task
      system_name_file = File.expand_path(File.join(Dir.home, "/.system_name"))
      system_name = File.open(system_name_file).read

      continue_if(File.exist?(system_name_file), "File ~/.system_name does not exist.")
      continue_if(!system_name.empty?,  "File ~/.system_name does not include a name.")

      puts(info_message("Setting system name to ") + system_name)
      system scutil_set("ComputerName #{system_name}")
      system scutil_set("HostName #{system_name}")
      system scutil_set("LocalHostName #{system_name}")
      system "sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string #{system_name}"
    end

    private

    def scutil_set(options)
      "sudo scutil --set #{options}"
    end
  end
end
