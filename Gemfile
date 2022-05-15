source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.3"

gem "pg"
gem "puma"
gem "sprockets-rails"

gem "cssbundling-rails"
gem "jsbundling-rails"
gem "slim"
gem "turbo-rails"

gem "govuk-components"

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem "hotwire-livereload"
  gem "spring"
  gem "web-console"

  gem "prettier_print", require: false
  gem "rubocop-govuk", require: false
  gem "solargraph", require: false
  gem "syntax_tree", require: false
  gem "syntax_tree-haml", require: false
  gem "syntax_tree-rbs", require: false
end

group :test do
  gem "capybara"
  gem "cuprite"
end
