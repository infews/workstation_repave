module Repave

  require_relative File.join(".", "repave", "task.rb")

  Dir[File.join(".", "repave", "*.rb")].each do |task_file|
    require_relative task_file
  end

end
