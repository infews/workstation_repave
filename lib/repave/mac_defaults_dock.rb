module Repave
  class MacDefaultsDock < MacDefaults
    COMMANDS =
      {
        "Enable highlight hover effect for the grid view of a stack (Dock)":
          "defaults write com.apple.dock mouse-over-hilite-stack -bool true",
        "Set the icon size of Dock items to 36 pixels":
          "defaults write com.apple.dock tilesize -int 36",
        "Set minimize/maximize window effect to scale":
          'defaults write com.apple.dock mineffect -string "scale"',
        "Minimize windows into their application’s icon":
          "defaults write com.apple.dock minimize-to-application -bool true",
        "Show indicator lights for open applications in the Dock":
          "defaults write com.apple.dock show-process-indicators -bool true",
        "Don’t automatically rearrange Spaces based on most recent use":
          "defaults write com.apple.dock mru-spaces -bool false",
        "Set Doc to auto hide/show":
          "defaults write com.apple.dock autohide -bool true"
      }
  end
end

