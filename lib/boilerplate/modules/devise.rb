require "tty-prompt"
require "active_support/inflector"

module Devise
  def install_devise(silent: false, **)
    prompt = TTY::Prompt.new(quiet: true)

    if silent || prompt.yes?("Install Devise?")
      # Install devise
      gem "devise"
      run "bundle install"
      rails_command("g devise:install")

      # Set up devise model
      resource = silent ? "User" : prompt.ask("What do you want to call your devise model?", default: "User")
      rails_command("g devise #{resource}")

      # Generate a migration and add admin column to it
      migration_name = "add_admin_to_#{resource.pluralize.downcase}"
      rails_command "g migration #{migration_name}"

      inject_into_file Dir.glob("db/migrate/*_#{migration_name}.rb").first, after: "def change" do
        "\n\t\tadd_column :#{resource.pluralize.downcase}, :admin, :boolean, default: false"
      end

      # Add a t&c validation to the resource model

      # Enable confirmable and lockable

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
