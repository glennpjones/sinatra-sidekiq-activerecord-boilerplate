# About

This is a quick boilerplate setup to get sinatra up and running with sqlite, activerecord, sidekiq, dotenv and pry.

I started from [sinatra-sidekiq](https://github.com/p8952/sinatra-sidekiq)

# Ensure

- you have `redis` installed and running

# Startup

```
bundle exec rackup # server
bundle exec sidekiq -r ./app.rb # sidekiq
bundle exec rake console # console
```

# To add a model

```
bundle exec rake db:create_migration NAME=create_some_model
# regular activerecord migration syntax
# make sure to make the model under lib/models/
```
