# Rakefile
require 'sinatra/activerecord/rake'

namespace :db do
  task :load_config do
    require "./app"
  end
end

task :console do
  exec('bundle exec irb -I. -r app.rb')
end
