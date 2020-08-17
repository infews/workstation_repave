module Repave
  class InstallOhMyZsh
    include Task

    def oh_my_zsh_present?
      File.exist? File.expand_path("~/.oh-my-zsh")
    end

    def go
      if oh_my_zsh_present?
        puts color_message("OhMyZsh! is present.", :green)
        return
      end

      puts color_message("Installing OhMyZsh", :cyan)
      system 'sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
    end
  end
end

