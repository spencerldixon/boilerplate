require "tty-prompt"

module Bullet
  def install_bullet(silent: false)
    prompt = TTY::Prompt.new(quiet: true)

    if silent || prompt.yes?("Install Bullet?")
      # Install bullet
      gem_group :development do
        gem "bullet"
      end

      run "bundle install"
      rails_command "g bullet:install"
    end
  end
end
