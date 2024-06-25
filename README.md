# Boilerplate

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

You can also all the usual rails flags:

```
boilerplate new blog -d postgresql
```

If you don't care, you can go for the omakase install, which will not ask any questions and give you a boilerplate rails app based on my personal preferences.

```
boilerplate new blog --omakase
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/spencerldixon/boilerplate.

