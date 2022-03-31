# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'coffee-rails', '~> 5.0', '>= 5.0.0'
gem 'devise', '~> 4.7', '>= 4.7.3'
gem 'jbuilder', '~> 2.7', '>= 2.7.0'
gem 'pg', '~> 1.0'
gem 'puma', '~> 5.6', '>= 5.6.4'
gem 'rails', '~> 6.1', '>= 6.1.3.2'
gem 'sass-rails', '~> 6.0', '>= 6.0.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.6'
  gem 'rubocop', '~> 1.15.0'
  gem 'spring', '>= 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0.1'
  gem 'web-console', '>= 4.1.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
