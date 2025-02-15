# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.4.2'

gem 'coffee-rails', '~> 5.0'
gem 'devise', '~> 4.9', '>= 4.9.3'
gem 'jbuilder', '~> 2.11', '>= 2.11.5'
gem 'pg', '~> 1.5', '>= 1.5.4'
gem 'puma', '~> 6.4', '>= 6.4.2' # major update
gem 'rails', '~> 8.0', '>= 8.0.0' # major update
gem 'sass-rails', '~> 6.0'
gem 'turbolinks', '~> 5.2', '>= 5.2.1'
gem 'uglifier', '~> 4.2' # massive udpate

group :development, :test do
  gem 'byebug', '~> 11.1', '>= 11.1.3', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'listen', '~> 3.8'
  gem 'rubocop', '~> 1.60'
  gem 'rubocop-rails', '~> 2.23', '>= 2.23.1'
  gem 'spring', '~> 4.1', '>= 4.1.3' # couple major update
  gem 'spring-watcher-listen', '~> 2.1'
  gem 'web-console', '~> 4.2', '>= 4.2.1'
end

gem 'tzinfo-data', '~> 1.2023', '>= 1.2023.4', platforms: %i[mingw mswin x64_mingw jruby]
