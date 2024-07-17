require "tty-prompt"
require "active_support/inflector"

module Devise
  MODULES = %w(
    lockable
    trackable
    confirmable
  )

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
      inject_into_file "app/models/#{resource.downcase}.rb", before: "end" do
        <<-eos
  \n\t# Add terms and conditions validation on create
  attr_accessor :terms_and_conditions
  validates_acceptance_of :terms_and_conditions, allow_nil: false, on: :create
        eos
      end

      # Install additional devise modules
      selected_modules = silent ? MODULES : prompt.multi_select("Install additional modules for Devise", MODULES)
      selected_modules.each do |devise_module|
        self.send("install_devise_#{devise_module}", resource)
      end

      # Install views
      if silent || prompt.yes?("What do you want to copy over boilerplate's prestyled devise views and partials?")
        # TODO Copy devise views
      else
        if prompt.yes?("Do you want to generate devise's default views?")
          rails_command("g devise:views")
        end
      end
    end
  end

  def install_devise_lockable(resource)
    text = <<-eos
      t.integer  :failed_attempts, default: 0, null: false
      t.string   :unlock_token
      t.datetime :locked_at
      add_index :users, :unlock_token,         unique: true
    eos

    self.send("install_devise_module", resource, "lockable", text)
  end

  def install_devise_trackable(resource)
    text = <<-eos
      Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
    eos

    self.send("install_devise_module", resource, "trackable", text)
  end

  def install_devise_confirmable(resource)
    text = <<-eos
      Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable
      add_index :users, :confirmation_token,   unique: true
    eos

    self.send("install_devise_module", resource, "confirmable", text)
  end

  def install_devise_module(resource, module_name, migration_text)
    # Add to the modules list in the model file
    inject_into_file "app/models/#{resource.downcase}.rb", after: /devise :.+\n.+/, force: true do
      ", :#{module_name}"
    end

    # Uncomment lines from devise migration
    migration_text.lines.each do |line|
      uncomment_lines Dir.glob("db/migrate/*_devise_create_#{resource.pluralize.downcase}.rb").first, line.strip
    end
  end
end
