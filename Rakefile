require 'rake'

EXCLUDES = ['README.md', 'Rakefile']

HOME_DIRECTORY    = ENV['HOME']
PRESENT_DIRECTORY = ENV['PWD']
SRC_DIRECTORY     = "#{HOME_DIRECTORY}/.src"
SUBLIME_PACKAGES  = "#{HOME_DIRECTORY}/Library/Application Support/Sublime Text 3/Packages"
VIM_DIRECTORY     = "#{HOME_DIRECTORY}/.vim"
XCODE_DIRECTORY   = "#{HOME_DIRECTORY}/Library/Developer/Xcode/UserData/"

REPOSITORIES = {
  source: {
    repos: [['chriskempson/base16-builder']]
  },
  sublime: {
    packages: [
      ['cucumber/cucumber-tmbundle', 'Cucumber'],
      ['facelessuser/ApplySyntax', 'ApplySyntax', 'ST3'],
      ['facelessuser/BracketHighlighter', 'BracketHighlighter', 'ST3'],
      ['ignacysokolowski/SublimeVintageNumbers', 'VintageNumbers'],
      ['jashkenas/coffee-script-tmbundle', 'CoffeeScript'],
      ['jcartledge/sublime-surround', 'Surround', 'st3'],
      ['jcartledge/sublime-worksheet', 'Worksheet', 'st3'],
      ['jcartledge/vintage-sublime-surround', 'VintageSurround'],
      ['jisaacks/GitGutter', 'GitGutter'],
      ['kemayo/sublime-text-git', 'Git', 'python3'],
      ['kkga/spacegray', 'Theme - Spacegray'],
      ['lmno/TOML', 'TOML'],
      ['MarioRicalde/SCSS.tmbundle', 'SCSS'],
      ['nathos/sass-textmate-bundle', 'Sass', 'sublime'],
      ['quiqueg/Swift-Sublime-Package', 'Swift'],
      ['reactjs/sublime-react', 'React'],
      ['revolunet/sublimetext-markdown-preview', 'MarkdownPreview'],
      ['rspec/rspec.tmbundle', 'RSpec'],
      ['wbond/sublime_alignment', 'Alignment']
    ]
  },
  vim: {
    autoload: [['tpope/vim-pathogen']],
    bundle: [
      ['tpope/vim-git'],
      ['tpope/vim-rails']
    ]
  }
}

namespace :dotfiles do
  task all: ['clone', 'link', 'system']

  desc 'Clone and symlink dependent repositories.'
  task :clone do
    REPOSITORIES.each do |mod, submods|
      submods.each do |submod, repositories|
        repositories.each do |repository|
          clone_repository(repository)

          case mod
          when :sublime
            create_symlink("#{SRC_DIRECTORY}/#{repository[0].split('/')[1]}", "#{SUBLIME_PACKAGES}/#{repository[1] || repository[0].split('/')[1]}")
          when :vim
            FileUtils.mkdir_p "#{VIM_DIRECTORY}/#{submod}" unless File.directory? "#{VIM_DIRECTORY}/#{submod}"

            if submod == :bundle
              create_symlink("#{SRC_DIRECTORY}/#{repository[0].split('/')[1]}", "#{VIM_DIRECTORY}/bundle/#{repository[1] || repository[0].split('/')[1]}")
            else
              FileUtils.cd "#{SRC_DIRECTORY}/#{repository[0].split('/')[1]}" do
                files = Dir.glob('*/*')
                files.each { |file| create_symlink("#{SRC_DIRECTORY}/#{repository[0].split('/')[1]}/#{file}", "#{VIM_DIRECTORY}/#{submod}/#{file.split('/')[1]}") }
              end
            end
          when :xcode
            FileUtils.mkdir_p "#{XCODE_DIRECTORY}/FontAndColorThemes" unless File.directory? "#{XCODE_DIRECTORY}/FontAndColorThemes"

            FileUtils.cd "#{SRC_DIRECTORY}/#{repository[0].split('/')[1]}" do
              files = Dir.glob('*') - EXCLUDES
              files.each { |file| create_symlink("#{SRC_DIRECTORY}/#{repository[0].split('/')[1]}/#{file}", "#{XCODE_DIRECTORY}/FontAndColorThemes/#{file}") }
            end
          end
        end
      end
    end
  end

  desc 'Symlink main dotfiles and other settings files.'
  task :link do
    home_files = Dir.glob('*').reject { |f| File.directory? f } - EXCLUDES
    sublime_files  = Dir.glob('sublime/*')
    bundler_files = Dir.glob('bundle/*')

    home_files.each { |filename| create_symlink("#{PRESENT_DIRECTORY}/#{filename}", "#{HOME_DIRECTORY}/.#{filename}") }
    sublime_files.each  { |filename| create_symlink("#{PRESENT_DIRECTORY}/#{filename}", "#{SUBLIME_PACKAGES}/User/#{filename.split('/')[1]}") }

    FileUtils.mkdir_p "#{HOME_DIRECTORY}/.bundle" unless File.directory? "#{HOME_DIRECTORY}/.bundle"
    bundler_files.each { |filename| create_symlink("#{PRESENT_DIRECTORY}/#{filename}", "#{HOME_DIRECTORY}/.bundle/#{filename.split('/')[1]}") }
  end

  def clone_repository(repository, target_directory=SRC_DIRECTORY)
    target_file = "#{target_directory}/#{repository[0].split('/')[1].gsub('.', '-')}"

    if File.exists? target_file
      puts "** #{repository[0]} already cloned. **"
    else
      puts "\n**** Cloning #{repository[0]} ****"
      system "git clone -b #{repository[2] || 'master'} 'https://github.com/#{repository[0]}.git' '#{target_file}'"
    end
  end

  desc 'Run Mac OS X settings script.'
  task :system do
    system "#{PRESENT_DIRECTORY}/osx/set-defaults"
  end

  def create_symlink(source, target)
    unless File.symlink?(target) && File.readlink(target) == source
      if File.exists?(target)
        backup = [target, 'backup'].join('.')
        FileUtils.mv target, backup, force: true unless File.identical? target, backup
      end

      FileUtils.ln_s source, target, force: true
    end
  end
end

desc 'Run all dotfiles tasks in ordered succession.'
task dotfiles: 'dotfiles:all'

task default: :dotfiles
