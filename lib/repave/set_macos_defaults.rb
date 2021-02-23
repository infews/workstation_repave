module Repave
  class SetMacOsDefaults
    include Task

    def run_task
      puts info_message("Setting various MacOS defaults.")
      system File.join(ASSETS_PATH, "macos")
    end
  end
end

