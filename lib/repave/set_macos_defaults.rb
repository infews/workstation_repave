module Repave
  class SetMacOsDefaults
    include Task

    def go
      puts color_message 'Setting various MacOS defaults', :cyan
      system "./assets/macos"
    end
  end
end

