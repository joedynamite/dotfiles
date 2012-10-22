require 'rake'

EXCLUDES = ['README.md', 'Rakefile']
HOME     = ENV['HOME']
PWD      = ENV['PWD']
SUBL     = "#{HOME}/Library/Application Support/Sublime Text 2/Packages/User"

task :install do
  linkable_files = Dir.glob('*').reject { |f| File.directory? f } - EXCLUDES
  sublime_files  = Dir.glob('sublime/*')

  linkable_files.each { |filename| linkup(filename) }
  sublime_files.each  { |filename| linkup(filename, SUBL, false) }
end

def linkup(filename, target_dir=HOME, dotfile=true)
  file = [PWD, filename].join('/')

  filename.insert(0, '.') if dotfile
  filename = filename.split('/')[1] unless dotfile

  target = [target_dir, filename].join('/')

  if File.exists?(target) || File.symlink?(target)
    backup = [target, 'backup'].join('.')
    FileUtils.mv target, backup, force: true unless File.identical? target, backup
  end

  FileUtils.ln_s file, target, force: true
end

task default: 'install'
