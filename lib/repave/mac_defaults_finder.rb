module Repave
  class MacDefaultsFinder
    include MacDefaults

    COMMANDS =
      {
        "Show icons on desktop for drives":
          [
            "defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true",
            "defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true",
            "defaults write com.apple.finder ShowMountedServersOnDesktop -bool true",
            "defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true"
          ],
        "Show path bar on Finder windows":
          "defaults write com.apple.finder ShowPathbar -bool true",
        "Show full POSIX path as Finder title":
          "defaults write com.apple.finder _FXShowPosixPathInTitle -bool true",
        "Avoid creating .DS_Store files on network or USB volumes":
          [
            "defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true",
            "defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true"
          ],
        "Show the ~/Library folder":
          "chflags nohidden ~/Library",
        "Show the /Volumes folder":
          "sudo chflags nohidden /Volumes"
      }
  end
end

