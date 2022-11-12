source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", '~> 7.0.4'
gem "sprockets-rails", '~> 3.4.2'
gem "pg", '~> 1.4.4'
gem "puma", '~> 6.0.0'
gem "jsbundling-rails", '~> 1.0.3'
gem "turbo-rails", '~> 1.3.2'
gem "stimulus-rails", '~> 1.1.1'
gem "cssbundling-rails", '~> 1.1.1'
gem "redis", '~> 5.0.5'
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "bootsnap", "~> 1.13.0", require: false
gem "good_job", '~> 3.6.0'

# Gems
gem "devise", '~> 4.8.1'
gem "inline_svg", '~> 1.8.0'

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "rspec-rails", '~> 6.0.1'
  gem "factory_bot_rails", '~> 6.2.0'
  gem "standard", '~> 1.17.0'
  gem "brakeman", "~> 5.3.1", require: false
  gem "faker", '~> 3.0.0'
  gem "dotenv-rails", '~> 2.8.1'
end

group :development do
  gem "web-console", '~> 4.2.0'
  gem "letter_opener", '~> 1.8.1'
end
