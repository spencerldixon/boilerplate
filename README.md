# 🔥 Boilerplate

A mildly opinionated starting point for generating rails projects based on good practices and clean code.

## Installation

```
gem install boilerplate
```

## Usage

Use Boilerplate just how you'd use the `rails` command in generating a new application. Boilerplate will then start a CLI prompt asking you what you'd like to add to your application.

```
boilerplate new app_name
```

You can also add all the usual rails flags and boilerplate will preserve them:

```
boilerplate new blog -d postgresql
```

If you don't care, you can go for the omakase install, which will not ask any questions and give you a boilerplate rails app based on my personal preferences. This will default to postgresql and tailwind.

```
boilerplate new blog --omakase
```

### Adding boilerplate to an existing app

Since boilerplate is a collection of rails templates, you can take advantage of this by adding them to existing apps by using `app:template` and then the `-x` flag with the name of the module you want to install. A full list of modules is in the `lib/boilerplate/modules/` directory. Use the file name without the `.rb`

```
boilerplate app:template -x devise
```

## Notes and stuff to be aware of

If you use Boilerplate for generating views, be aware that Boilerplate uses tailwind for the majority of it's html templates and you will need to install this. This is done by default in the omakase install, and asked for in the default installation wizard.

## Modules

Boilerplate comes with the following modules...

- DaisyUI - a themeable component library for TailwindCSS
- Devise - user authentication with an extra `admin` boolean column, t&cs validations, confirmable and lockable enabled, and sensible devise defaults
- Bullet - help kill N+1 queries and unused eager loading
- Metatags - SEO plugin for Rails with the meta-tags gem (uses AppName)
- HomePage - Set root path for your app between login or boilerplate's default static home page template (uses AppName)
- LegalPages - Generate a default privacy and t&c pages at `/privacy` and `/terms_and_conditions` (uses AppName)
- Analytics - adds an empty `app/views/shared/_analytics.html.erb` partial for you to put your analytics in, required in all layouts by default
- FontAwesome - Free icons library

### Coming soon / In Progress
- AppName - sets your app name as a custom config variable to be used everywhere your app name is mentioned so you can change it in one place
- GoodJob - a PostgreSQL backed Active Job backend (installs dashboard too, authenticated for admins only)
- ActiveStorage - configure active storage with Kamal in production
- Dashboard - a blank user dashboard template
- AdminDashboard - an admin dashboard template to list and search for users
- FlashNotifications - prestyled flash notifications with vanilla rails or turbo streams
- Cancancan - Role based authorization configured with nicer error messages in `en.yml`
- RSpec - Testing suite with RSpec, FactoryBot and Capybara
- SitemapGenerator - XML Sitemap generator with the `sitemap_generator` gem
- Mailer - Mailer configuration per environment
- OnboardingModal - a turbo frames based onboarding modal displayed to users post registration
- Favicons - a default PWA favicon set
- ErrorMessageOn - a helper for rendering nicer per-field validation messages in forms
- GitIgnore - sensible defaults for the `.gitignore` file
- RobotsTxt - disable OpenAI's GPTBot web crawler in the `robots.txt` file
- ForceHttps - sensible defaults for forcing HTTPS (https://www.stackhawk.com/blog/rails-http-strict-transport-security-guide-what-it-is-and-how-to-enable-it/)[https://www.stackhawk.com/blog/rails-http-strict-transport-security-guide-what-it-is-and-how-to-enable-it/]
- RemoveTrailingSlashes - removes trailing slashes from urls (https://tosbourn.com/ruby-on-rails-seo/#remove-trailing-slashes)[https://tosbourn.com/ruby-on-rails-seo/#remove-trailing-slashes]
- Stripe - payment integration with Stripe

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/spencerldixon/boilerplate.
