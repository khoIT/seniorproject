source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.0.1'

# Use sqlite3 as the database for Active Record
#gem 'sqlite3'
group :production, :staging do
      gem 'pg'
      gem 'rails_12factor'
end
group :development, :test do
    gem 'rspec-rails', '~> 3.0.0'
    gem 'byebug', '~> 3.5.1'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'
gem "therubyracer"
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem "twitter-bootstrap-rails"

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
gem 'devise'

#Simple cov for coverage testing
gem 'simplecov', :require => false, :group => :test
gem "factory_girl_rails", "~> 4.0"
gem 'jquery-datatables-rails', '~> 2.2.1'
gem 'simple_form', '~> 3.0.0.rc'

gem 'select2-rails'

# later we will take advantage of this gem
gem 'jquery-ui-rails', '~> 5.0.0'
gem 'bootstrap-switch-rails', '~> 3.0.2'
gem 'momentjs-rails', '>= 2.8.1'
gem 'bootstrap3-datetimepicker-rails', '~> 3.1.2'
gem 'omniauth-facebook'
gem 'activerecord-session_store', github: 'rails/activerecord-session_store'
gem "font-awesome-rails"
gem "omniauth-google-oauth2"
group :development, :test do
  gem 'foreman'
end
gem 'datejs-rails'
gem 'angularjs-rails'
gem 'omniauth'
gem 'sinatra'
gem 'omniauth-venmo'
gem 'rails-observers'
gem 'rails-perftest'
gem 'ruby-prof'
gem 'thin'
gem 'private_pub'
