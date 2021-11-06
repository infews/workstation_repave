# Helper module for all Repave Tasks
module Repave
  module Task
    START_COLOR = {
      :red => "\e[31m",
      :green => "\e[32m",
      :cyan => "\e[36m",
    }
    STOP_COLOR = "\e[0m"

    ROOT_PATH = File.expand_path(File.join(__dir__, "..", ".."))
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
end
