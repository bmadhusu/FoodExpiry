source 'https://rubygems.org'
ruby '1.9.3'
gem 'rails', '4.0.2'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# for now use protected attributes gem rather than strong just to keep working
gem 'protected_attributes'

group :development, :test do
	gem 'sqlite3', '1.3.8'
	gem 'rspec-rails', '2.13.1'
	gem 'guard-rspec', '2.5.0'
	gem 'spork-rails', '4.0.0'
	gem 'guard-spork', '1.5.0'
	gem 'childprocess', '0.3.6'
end

group :test do
	gem 'selenium-webdriver', '2.35.1'
	gem 'capybara', '2.1.0'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '4.0.1'
  gem 'coffee-rails', '4.0.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :production do
	gem 'pg', '0.15.1'
	gem 'rails_12factor', '0.0.2'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
gem 'debugger'

gem 'rufus-scheduler', '2.0.24', :require => "rufus/scheduler"

# use Haml for templates

gem 'haml'
# use ruby debugger
#group :development, :test do
#  gem 'ruby-debug19', :require => 'ruby-debug'
#end
