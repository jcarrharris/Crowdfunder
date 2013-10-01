source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

gem 'pg'
gem 'sorcery'

group :tools do
	gem 'guard-rspec' #auto runs tests 
end

group :development do
	gem 'rspec-rails', '~> 2.0' # using rspec instead of test unit
	gem 'better_errors' # makes the errors we see in the browser more descriptive
	gem "binding_of_caller"
	gem 'pry-rails'
	gem 'letter_opener'
end

group :test do 
	gem 'rspec-rails', '~> 2.0' # using rspec instead of test unit
	gem "factory_girl_rails" 
	gem "capybara" # needed for our integration tests, which we'll talk about more later
	gem "launchy"
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'kaminari'
gem 'kaminari-bootstrap'
gem 'carrierwave'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

gem 'strong_parameters'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
