module Repave
  class JetbrainsPrefs
    include Task

    def run_task
      workspace_path = File.expand_path(File.join(Dir.home, "workspace"))

      Dir.chdir(workspace_path) do
        unless File.exist? "jetbrains-ide-prefs"
          puts info_message("Cloning jetbrains-ide-prefs repo locally")
          system 'git clone https://github.com/professor/jetbrains-ide-prefs.git'
        end
      end

       Dir.chdir(File.join(workspace_path, 'jetbrains-ide-prefs')) do
        puts info_message("Updating local copy of jetbrains-ide-prefs")
        system "git pull"

        puts info_message('Installing Jetbrains IDE Prefs for all installed IDEs')
        system "cli/bin/ide_prefs install"
      end
    end
  end
end
