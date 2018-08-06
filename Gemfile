source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'mysql2', '0.3.18'
gem 'rails', '~> 5.0.0'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'
# Use carrierwave to manage file upload
gem 'carrierwave', '~> 1.0'
gem 'carrierwave-base64'

gem 'devise_token_auth'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # Use faker to generate fake data
  gem 'faker', git: 'https://github.com/stympy/faker.git', branch: 'master'
  # Use facotry_bot to create fake model
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'rubocop'
end

group :development do
  # overcommit linter
  gem 'listen', '~> 3.0.5'
  gem 'overcommit'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
