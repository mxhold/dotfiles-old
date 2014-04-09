#!/usr/bin/env ruby
# Symlink files in current directory to ~

base_path = Dir.pwd
Dir.glob("#{base_path}/.*").reject { |path| path[/\.git\z/] }.each do |filename|
  `ln -s #{filename} ~/#{File.basename(filename)}`
end

