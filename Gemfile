# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'coffee-rails', '~> 4.2', '>= 4.2.2'
gem 'devise', '~> 4.7', '>= 4.7.1'
gem 'jbuilder', '~> 2.7', '>= 2.7.0'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.12', '>= 3.12.6'
gem 'rails', '~> 6.0.3.0', '>= 6.0.3.4'
gem 'sass-rails', '~> 5.0', '>= 5.0.7'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.3'
  gem 'rubocop', '~> 0.89.0'
  gem 'spring', '>= 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0.1'
  gem 'web-console', '>= 3.7.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
