# if File.exists?('./Gemfile')
#   require 'bundler'
#   Bundler.require
# end

require './config/application.rb' if File.exists? './config/application.rb'
