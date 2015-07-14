source 'https://rubygems.org'
#ruby '2.1.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.2'

# Use sqlite3 as the database for Active Record
gem 'sqlite3', :group => [:development, :test, :production]
#gem 'pg', :group => :production

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# Security
gem 'breach-mitigation-rails'

# logging
gem 'lumberjack'

# Developer console
gem 'pry'

gem 'simple_form'

gem 'breadcrumbs_on_rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

gem 'bootstrap-sass'
gem 'devise'
gem 'devise_invitable'
gem 'pundit'
#gem 'unicorn'
#gem 'unicorn-rails'
gem 'thin'
gem 'tzinfo-data', platforms: [:x64_mingw, :mingw, :mswin]

group :development do
  gem 'rubycritic', require: false	
  gem 'better_errors'
  gem 'binding_of_caller', platforms: [:mri_21]
  gem 'hub', require: nil
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'spring-commands-rspec'
  gem 'rubocop', '0.29.1'  
  gem 'brakeman'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'activerecord-reset-pk-sequence'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'poltergeist'
end

gem 'rails_12factor', group: :production
