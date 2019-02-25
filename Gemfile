source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby '2.4.1'

#gems
gem 'rails', '~> 5.2.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'figaro'
gem 'faraday'
gem 'vcr'
gem 'webmock'
gem 'rspec-rails'
gem 'fast_jsonapi'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'launchy'
  gem 'capybara'
  gem 'shoulda-matchers'
  gem 'simplecov'
  gem 'pry'
  gem 'newrelic_rpm'
  gem 'omniauth'
  gem 'redis'
  gem 'turbolinks'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
