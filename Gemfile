source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.3"

gem "cssbundling-rails"
gem "jsbundling-rails"
gem "pg"
gem "propshaft"
gem "puma"
gem "slim"
gem "slim-rails"
gem "stimulus-rails"
gem "turbo-rails"

gem "govuk-components"
gem "govuk_design_system_formbuilder"

gem "devise"
gem "dotenv-rails", groups: %i[development test]
gem "faraday"
gem "faraday-retry"
gem "octokit"
gem "omniauth-github"
gem "omniauth-rails_csrf_protection"
gem "rubyzip"

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem "hotwire-livereload"
  gem "spring"
  gem "web-console"

  gem "annotate", require: false
  gem "prettier_print", require: false
  gem "rubocop-govuk", require: false
  gem "solargraph", require: false
  gem "solargraph-rails", require: false
  gem "syntax_tree", require: false
  gem "syntax_tree-haml", require: false
  gem "syntax_tree-rbs", require: false
end

group :test do
  gem "cuprite"
  gem "minitest-spec-rails"
  gem "simplecov", require: false
end
