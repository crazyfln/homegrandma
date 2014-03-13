source 'https://rubygems.org'
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails',    '4.0.2'
gem 'devise',   '~> 3.2.2'
gem 'pg'

group :production do
  gem 'newrelic_rpm'
  gem 'memcachier'
  gem 'rack-cache'
  gem 'dalli'
  gem 'kgio'
  gem 'rails_12factor'
end

gem 'haml-rails'
gem 'sass-rails',     '~> 4.0.0'
gem 'uglifier',       '>= 1.3.0'
gem 'coffee-rails',   '~> 4.0.0'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'fancybox2-rails', '~> 0.2.4'

gem 'jbuilder',       '~> 1.2'
gem 'simple_form'
gem 'nested_form'
gem 'enumerize'

gem 'kaminari'
gem 'yajl-ruby'
gem 'geocoder'
gem 'tire'
gem 'redis'

# Handling Attachment
gem 'carrierwave'
gem 'unf'
gem 'fog',             '~> 1.19.0'
gem 'mini_magick'


# Gem for generate dummy data, we need it also for production
gem 'factory_girl_rails',   '~> 4.0'
gem 'ffaker'


# Gem to make view more modular
gem 'cells'

# Notifier
gem 'exception_notification'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'debugger'
  gem 'annotate'
  gem 'quiet_assets'
  gem 'rspec-rails',          '~> 3.0.0.beta'
  gem 'shoulda-matchers'
  gem 'awesome_print'
  gem 'simplecov',            :require => false
  gem 'database_cleaner',     '~> 1.2.0'
end