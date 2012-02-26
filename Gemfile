source 'http://rubygems.org'

gem 'rails', '3.1.1'
gem "koala"
# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# Heroku needed gems
gem 'heroku'
gem 'execjs'
#gem 'therubyracer' #REMEMBER TO UNCOMMENT THIS LINE BEFORE PUSHING BACK TO REPO.
#These gems are just for my own convenience.
group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem "minitest"
end
# Heroku does not support SQLite, use PostgreSQL instead
group :production do
  gem 'pg'
end

group :development do
  gem 'sqlite3'
end

gem 'json'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

gem 'heroku'

