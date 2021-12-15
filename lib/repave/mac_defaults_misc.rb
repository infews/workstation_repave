module Repave
  class MacDefaultsMisc
    include MacDefaults

    def initialize
      @mac_os_settings = {
        "Close any open System Preferences panes, to prevent them from overriding settings we’re about to change":
          %q{osascript -e 'tell application "System Preferences" to quit'},

        "Only use UTF-8 in Terminal.app":
          "defaults write com.apple.terminal StringEncodings -array 4",

        "Show the main window when launching Activity Monitor":
          "defaults write com.apple.ActivityMonitor OpenMainWindow -bool true",

        "Enable the debug menu in Disk Utility":
          [
            "defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true",
            "defaults write com.apple.DiskUtility advanced-image-options -bool true"
          ],

        "Automatically quit printer app once the print jobs complete":
          'defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true',

        "Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window":
          "sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName",

        "Make the clock analog":
          "defaults write com.apple.menuextra.clock IsAnalog 1 && killall -KILL SystemUIServer"
      }
    end
  end
end

