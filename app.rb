require 'dotenv/load'
require 'sinatra/base'
require 'sidekiq'
require 'sidekiq/api'
require 'sidekiq/web'
require 'sinatra/activerecord'
require 'pry'

Dir["lib/**/*.rb"].reverse.each do |file|
  require_relative file
end

class App < Sinatra::Base

  get '/' do
    stats = Sidekiq::Stats.new
    workers = Sidekiq::Workers.new
    "
    <p>Processed: #{stats.processed}</p>
    <p>In Progress: #{workers.size}</p>
    <p>Enqueued: #{stats.enqueued}</p>
    <p><a href='/'>Refresh</a></p>
    <p><a href='/add_job'>Add Job</a></p>
    <p><a href='/sidekiq'>Dashboard</a></p>
    "
  end

  get '/add_job' do
    "
    <p>Added Job: #{TestWorker.perform_async(20)}</p>
    <p><a href='/'>Back</a></p>
    "
  end
end
