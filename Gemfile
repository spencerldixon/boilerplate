source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", "~> 7.0.5"
gem "sprockets-rails", "~> 3.4.2"
gem "pg", "~> 1.5.3"
gem "puma", "~> 6.2.2"
gem "jsbundling-rails", "~> 1.1.1"
gem "turbo-rails", "~> 1.4.0"
gem "stimulus-rails", "~> 1.2.1"
gem "cssbundling-rails", "~> 1.1.2"
gem "redis", "~> 5.0.6"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "bootsnap", "~> 1.15.0", require: false
gem "good_job", "~> 3.15.11"

# Gems
gem "devise", "~> 4.9.2"
gem "inline_svg", "~> 1.9.0"

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "rspec-rails", "~> 6.0.3"
  gem "factory_bot_rails", "~> 6.2.0"
  gem "standard", "~> 1.29.0"
  gem "brakeman", "~> 6.0.0", require: false
  gem "faker", "~> 3.2.0"
  gem "dotenv-rails", "~> 2.8.1"
end

group :development do
  gem "web-console", "~> 4.2.0"
  gem "letter_opener", "~> 1.8.1"
end
