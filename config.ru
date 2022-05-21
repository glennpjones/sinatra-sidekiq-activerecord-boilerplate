require './app.rb'

require 'securerandom'; File.open(".session.key", "w") { |f| f.write(SecureRandom.hex(32)) }

# now use the secret with a session cookie middleware
use Rack::Session::Cookie, secret: File.read('.session.key'), same_site: true, max_age: 86400

run Rack::URLMap.new('/' => App, '/sidekiq' => Sidekiq::Web)
