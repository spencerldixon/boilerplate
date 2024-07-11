require "tty-prompt"

module Devise
  def install_devise(silent: false)
    prompt = TTY::Prompt.new(quiet: true)

    if silent || prompt.yes?("Install Devise?")
      # Install devise
      gem "devise"
      run "bundle install"
      rails_command("g devise:install")

      # Set up devise model
      user_model = silent ? "User" : prompt.ask("What do you want to call your devise model?", default: "User")
      rails_command("g devise #{user_model}")

      if silent || prompt.yes?("What do you want to copy over boilerplate's prestyled devise views and partials?")
        # TODO Copy devise views
      else
        if prompt.yes?("Do you want to generate devise's default views?")
          rails_command("g devise:views")
        end
      end
    end
  end
end
