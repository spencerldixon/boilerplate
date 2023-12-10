# Rails 7 Boilerplate

A mildly opinionated starting point for rails projects based on good practices and clean code.

## Stack

Built on...

- Rails 7.1.2
- Ruby 3.2.2
- PostgreSQL 15
- Hotwire
- Tailwind (with Tailwind Forms)
- Bun
- Stimulus
- Good Job (background queue)
- Active Storage (S3)

## Gems & Packages

With these pre-installed...

- Devise
- RSpec
- FactoryBot
- Standardrb
- Brakeman
- Faker
- CanCanCan
- Animate.css (https://animate.style/)
- Font Awesome 6.2.0 Free Icons (https://fontawesome.com/search?o=r&m=free)
- Letter Opener (https://github.com/ryanb/letter_opener)
- Bullet
- Sitemap Generator
- Pay

## Setup

Fork the project and do a find and replace for `boilerplate`

```
rails db:create db:migrate db:seed

./bin/dev
```

The default user will be seeded with the following credentials

Email: `test@test.com`
Password: `test1234test`

## Credentials

Boilerplate uses the rails default of multi-environment encrypted credentials. Follow these steps to get set up.

1. Delete `config/credentials`
2. run `rails credentials:edit --environment production` (for each environment)
3. Populate each config file with the following...1

```yaml
secret_key_base: XXXX

mailer:
  support_email: support@boilerplate.com
  noreply_email: noreply@boilerplate.com
  username: XXXX
  password: XXXX
  domain: XXXX
  address: XXXX
  port: 456

amazon:
  access_key_id: ""
  secret_access_key: ""
  region: ""
  bucket: ""

stripe:
  private_key: xxxx
  public_key: yyyy
  signing_secret:
  - aaaa
  - bbbb
```

4. Replace values with your own credentials!

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
- Cancancan installed with default abilites set up for admin
- Bullet set up to catch n+1s early
- Performance tweaks for a high Lighthouse score out of the box
- Sitemap Generator gem for dynamic sitemaps - `rails sitemap:refresh`
- Active Storage configured with S3 to host the sitemap (since ephemeral storage with Heroku)
- The Pay gem set up for handling payment with Stripe

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
- More pleasing error messages set up in `en.yml` for Cancancan
- Disallows OpenAI's GPTBot web crawler in the `robots.txt` file
- Force HTTPS, and redirect https traffic - https://www.stackhawk.com/blog/rails-http-strict-transport-security-guide-what-it-is-and-how-to-enable-it/
- Enables text compression with Rack::Deflator for better performance
- Adds default metatags for SEO in `app/views/shared/metatags.html.erb`
- Removes trailing slashes from urls - https://tosbourn.com/ruby-on-rails-seo/#remove-trailing-slashes
- Don't send Stripe emails from Boilerplate, but send them from Stripe instead


## Launch checklist

Before you launch, don't forget to...

1. Rename the app
2. Set config variables for your support email and other config
3. Add your analytics in `views/shared/_analytics.html.erb`
4. Add your metatags in `views/shared/_metatags.html.erb`
5. Make sure Stripe is set to send emails (Boilerplate will not by default, but you can set this in `config/initializers/pay.rb`)

## Tests & Linting

```
rspec
standardrb --fix
brakeman
```

## Deploy

Boilerplate is configured with a Procfile for Heroku deployment
Alternative PaaS deploys coming soon...
