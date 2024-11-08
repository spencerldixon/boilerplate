require "tty-prompt"

module Metatags
  def install_metatags(silent: false, app_name:, **)
    prompt = TTY::Prompt.new(quiet: true)

    if silent || prompt.yes?("Install Meta-tags?")
      gem "meta-tags"
      run "bundle install"
      rails_command "g meta_tags:install"
      inject_into_file 'app/views/layouts/application.html.erb', :before => "</head>" do
        <<-eos
    <%= display_meta_tags site: "#{app_name}" %>
        eos
      end
    end
  end
end
