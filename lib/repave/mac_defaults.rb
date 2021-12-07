# Some MacOS Defaults can be set from the command line.
# See https://mths.be/macos
# Note: Many of these change over time, so YMMV
module Repave
  module MacDefaults
    def run_task
      macos_defaults COMMANDS
    end

    private

    def macos_defaults(command_map)
      command_map.each do |message, commands|
        info_message "MacOS Preference: #{message}"
        Array(commands).each { |cmd| system cmd }
      end
    end
  end
end
