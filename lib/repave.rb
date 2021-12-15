module Repave

  module Task
    START_COLOR = {
      :red => "\e[31m",
      :green => "\e[32m",
      :cyan => "\e[36m",
    }
    STOP_COLOR = "\e[0m"

    ROOT_PATH = File.expand_path(File.join(__dir__, ".."))
    ASSETS_PATH = File.join(ROOT_PATH, "assets")
    DOTFILES_PATH = File.join(ROOT_PATH, "dotfiles")

    def continue_if(boolean, error_message)
      return if boolean

      puts fail_message(error_message)
      exit(1)
    end

    def success_message(text)
      color_message(text, :green)
    end

    def info_message(text)
      color_message(text, :cyan)
    end

    def fail_message(text)
      color_message(text, :red)
    end

    private

    def color_message(text, color)
      START_COLOR[color] + text + STOP_COLOR
    end
  end

  # Some MacOS Defaults can be set from the command line. See https://mths.be/macos
  # Note: Many of these change over time, so YMMV
  module MacDefaults
    include Task

    def run_task
      set_defaults @mac_os_settings
    end

    private

    def set_defaults(command_map)
      command_map.each do |message, commands|
        info_message "MacOS Preference: #{message.to_s}"
        Array(commands).each { |cmd| system cmd }
      end
    end
  end
end

# Require all of the rest of the tasks
Dir[File.join(__dir__, "repave", "*.rb")].each do |task_file|
  require_relative task_file
end
