source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.3"

gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "sprockets-rails"

gem "importmap-rails", "~> 1.0"
gem "turbo-rails"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "hotwire-livereload", "~> 1.1"
  gem "spring"
end
