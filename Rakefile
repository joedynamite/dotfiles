require 'rake'

HOME = ENV['HOME']
PWD  = ENV['PWD']
SUBL = "#{HOME}/Library/Application Support/Sublime Text 2/Packages/User"

task :install do
  filenames = Dir.glob('*') - ['README.md', 'Rakefile']
  linkable_files = filenames.reject { |f| f.include?("sublime") }
  sublime_files = filenames.select { |f| f.include?("sublime") }

  linkable_files.each { |filename| linkup(filename) }
  sublime_files.each { |filename| linkup(filename, SUBL, false) }
end

def linkup(filename, target_dir=HOME, dotfile=true)
  file = [PWD, filename].join('/')

  filename.insert(0, '.') if dotfile

  target = [target_dir, filename].join('/')

  if File.exists?(target) || File.symlink?(target)
    backup = [target, 'backup'].join('.')
    FileUtils.mv target, backup, force: true unless File.identical? target, backup
  end

  FileUtils.ln_s file, target, force: true
end

task default: 'install'
