module Repave
  class MacDefaultsInput
    include MacDefaults

    COMMANDS =
      {
        "Trackpad: enable tap to click for this user and for the login screen":
          [
            "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true",
            "defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1",
            "defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1"
          ],

        "Trackpad: map bottom right corner to right-click":
          [
            "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2",
            "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true",
            "defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1",
            "defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true",
          ],

        "Increase sound quality for Bluetooth headphones/headsets":
          'defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" - int 40',

        "Enable full keyboard access for all controls (e.g., enable Tab in modal dialogs)":
          "defaults write NSGlobalDomain AppleKeyboardUIMode -int 3",

        "Use scroll gesture with the Ctrl (^) modifier key to zoom":
          [
            "defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true",
            "defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144"
          ],

        "Follow the keyboard focus while zoomed in":
          "defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true"
    }
  end
end

