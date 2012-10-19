require 'rake'

task :install do
  filenames = Dir.glob('*')
  linkable_files = filenames.reject { |f| ["README.md", "Rakefile"].include?(f) || f.include?("sublime") }
  sublime_files = filenames.select { |f| f.include?("sublime") }

  linkable_files.each { |filename| linkup(filename) }
  sublime_files.each { |filename| linkup(filename, "#{ENV['HOME']}/Library/Application Support/Sublime Text 2/Packages/User", false) }
end

def linkup(filename, target_dir=ENV['HOME'], dotfile=true)
  file = [ENV['PWD'], filename].join('/')

  filename.insert(0, '.') if dotfile

  target = [target_dir, filename].join('/')

  if File.exists?(target) || File.symlink?(target)
    backup = [target, Time.now.to_i, 'backup'].join('.')
    FileUtils.mv target, backup
  end

  FileUtils.ln_s file, target
end

task default: 'install'
