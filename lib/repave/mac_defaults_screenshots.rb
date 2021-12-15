module Repave
  class MacDefaultsScreenshots
    include MacDefaults

    def initialize
      @mac_os_settings =
        {
          "Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)":
            'defaults write com.apple.screencapture type -string "png"',
          "Disable shadow in screenshots":
            "defaults write com.apple.screencapture disable-shadow -bool true",
        }
    end
  end
end

