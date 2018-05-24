require 'rainbow'
using Rainbow
require 'fileutils'

class LinkSlateFile

  @@slatefile = File.join Dir.pwd, 'assets', 'slate'
  @@slatefile_link = File.join Dir.home, '.slate'

  def LinkSlateFile.do
    return true
  end

  def LinkSlateFile.setup

    if present?
      puts '~/.slate ' + Rainbow('already exists, moving on').yellow
      return true
    end

    puts Rainbow('Creating Slate file symlink').green
    `ln -s #{@@slatefile} #{@@slatefile_link}`

    return true
  end

  def LinkSlateFile.present?
    File.exists? File.join(Dir.home, '.slate')
  end
end
