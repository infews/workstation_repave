require 'rainbow'
using Rainbow

class SystemName

  @@name = 'coldiron'

  def SystemName.setup(path)

    Rainbow("Setting system name to #{@@name}").green

    good_result = system "sudo scutil --set ComputerName #{@@name}"
    return good_result unless good_result

    good_result = system "sudo scutil --set HostName #{@@name}"
    return good_result unless good_result

    good_result = system "sudo scutil --set LocalHostName #{@@name}"
    return good_result unless good_result

    good_result = system "sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string #{@@name}"

    return good_result
  end
end




# Set computer name (as done via System Preferences → Sharing)
