# Rails 7 Boilerplate

A mildly opinionated starting point for rails projects based on good practices and clean code.

## Stack

Built on...

- Rails 7.0.4
- Ruby 3.2.2
- PostgreSQL 15
- Hotwire
- Tailwind (with Tailwind Forms)
- Esbuild
- Stimulus
- Good Job (background queue)

## Gems & Packages

With these pre-installed...

- Devise
- RSpec
- FactoryBot
- Standardrb
- Brakeman
- Faker
- Animate.css (https://animate.style/)
- Font Awesome 6.2.0 Free Icons (https://fontawesome.com/search?o=r&m=free)
- Letter Opener (https://github.com/ryanb/letter_opener)

## Setup

Fork the project and do a find and replace for `boilerplate`

```
cp .env.example .env

rails db:create db:migrate db:seed

./bin/dev
```

The default user will be seeded with the following credentials

Email: `test@test.com`
Password: `test1234test`

## Features

Here's what you get out of the box...

- A nice home page
- Responsive login and registration pages
- A responsive authenticated Dashboard with navigation
- UUIDs instead of incremental IDs
- Default User model with validations
- Validates user passwords against a list of common passwords for enhanced security (`lib/common_passwords.txt`)
- Validates acceptance of terms and conditions checkbox on user creation
- Default Devise installation with Confirmable and Lockable enabled
- Pre-styled Stimulus flash notifications
- A `Procfile` for Heroku deployments
- Empty partials for `app/views/shared/_analytics.html.erb` and `app/views/shared/_metatags.html.erb` to drop in analytics (consider using Plausible.io instead of GA!) and opengraph tags
- A favicon
- Tailwind CSS with Tailwind Forms and Tailwind Typography plugin
- A default minimalist Docker config for development
- Good Job for a background worker
- Font Awesome Icons (https://fontawesome.com/search?o=r&m=free)
- User has `first_name`, `last_name`, and `admin` columns
- Privacy Policy and T&C pages
- `error_message_on(resource, :field)` let's you render per-field validations
- `user.full_name` method
- A before action of `require_turbo_frame_request` to stop users accessing pages that should only be loaded via turbo frame (e.g. modals)
- An onboarding modal with turbo frames (easy to make multistep, just link to the next turbo frame)

## Configurations

Things that have been changed from their defaults...

- Devise default minimum password length has been increased from 6 to 8 characters
- Devise allows unconfirmed access for the first 14 days (to reduce user friction in trying out the product)
- Fixtures have been replaced with FactoryBot
- Tests have been replaced with RSpec
- Devise Confirmable and Lockable have been enabled on the User model
- Procfile (for Heroku deploys) runs `rails db:migrate` on each deploy release
- The base `ApplicationJob` class is configured with default strategies for discarding on deserialization error (a record not being found), retrying on deadlock, and retrying 3 times on a standard error before handing off to the worker to discard.
- Tailwind and `assets/stylesheets/application.tailwind.css` is configured with PostCSS to make it easier to add custom CSS. Tailwind Forms is also enabled.
- UUIDs are configured instead of incremental IDs as primary keys
- `.gitignore` will ignore database dumps, `.DS_Store` files and `.env` files
- Docker IP range has been whitelisted in `config/environments/development.rb` to allow the web console to work properly in development.
- Enable Stimulus debug mode in development
- Faker unique generator is reset after each test spec to ensure unique values don't run out
- Sends devise mail through GoodJob in a dedicated `:devise` queue
- Configures ActiveJob for test environment
- Configures Capybara to use `:rack_test` for most test, and `:selenium_headless` for js tests. Config in `spec_helper.rb`

## Tests & Linting

```
rspec
standardrb --fix
brakeman
```

## Deploy

Boilerplate is configured with a Procfile for Heroku deployment
Alternative PaaS deploys coming soon...
