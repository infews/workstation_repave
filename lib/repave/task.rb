module Repave
  module Task
    START_COLOR = {
      :red => "\e[31m",
      :green => "\e[32m",
      :cyan => "\e[36m",
    }
    END_COLOR = "\e[0m"

    def color_message(text, color)
      START_COLOR[color] + text + END_COLOR
    end

    def test(boolean, &block)
      return if boolean
      error_message = yield
      puts color_message(error_message, :red)
      exit(1)
    end
  end
end
