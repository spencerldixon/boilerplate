source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", "~> 7.1.2"
gem "sprockets-rails", "~> 3.4.2"
gem "pg", "~> 1.5.4"
gem "puma", "~> 6.4.0"
gem "jsbundling-rails", "~> 1.2.1"
gem "turbo-rails", "~> 1.5.0"
gem "stimulus-rails", "~> 1.3.0"
gem "cssbundling-rails", "~> 1.3.3"
gem "redis", "~> 5.0.8"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "bootsnap", "~> 1.16.0", require: false
gem "good_job", "~> 3.21.2"
gem "cancancan", "~> 3.5.0"
gem "sitemap_generator", "~> 6.3.0"
gem "rack-rewrite", "~> 1.5.1"
gem "aws-sdk-s3", "~> 1.136.0", require: false
gem "active_link_to", "~> 1.0.5"
gem "pay", "~> 7.1.0"
gem "stripe", "~> 10.2.0"

# Gems
gem "devise", "~> 4.9.3"
gem "inline_svg", "~> 1.9.0"

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "rspec-rails", "~> 6.1.0"
  gem "factory_bot_rails", "~> 6.4.2"
  gem "standard", "~> 1.32.1"
  gem "brakeman", "~> 6.0.1", require: false
  gem "faker", "~> 3.2.2"
  gem "bullet", "~> 7.1.4"
end

group :test do
  gem "capybara", "~> 3.39.2"
  gem "selenium-webdriver", "~> 4.16.0"
end

group :development do
  gem "web-console", "~> 4.2.1"
  gem "letter_opener", "~> 1.8.1"
end
