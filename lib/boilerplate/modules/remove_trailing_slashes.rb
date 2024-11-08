require "tty-prompt"

module RemoveTrailingSlashes
  def install_remove_trailing_slashes(silent: false, **)
    prompt = TTY::Prompt.new(quiet: true)

    if silent || prompt.yes?("Install rack-rewrite to remove trailing slashes from urls?")
      gem 'rack-rewrite'
      run 'bundle install'

      inject_into_file 'config/application.rb', before: /^\s\send\nend/ do
        <<-eos

    # Remove trailing slashes from urls
    config.middleware.insert_before(Rack::Runtime, Rack::Rewrite) do
      r301 %r{^/(.*)/$}, '/$1'
    end
        eos
      end
    end
  end
end
