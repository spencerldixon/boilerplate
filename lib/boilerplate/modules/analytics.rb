require "tty-prompt"

module Analytics
  FILES_PATH = File.join(Gem.loaded_specs["boilerplate"].full_gem_path, "lib", "boilerplate", "files")

  def install_analytics(silent: false, **)
    prompt = TTY::Prompt.new(quiet: true)

    if silent || prompt.yes?("Install empty views/shared/_analytics.html.erb partial?")
      template File.join(FILES_PATH, "app/views/shared/_analytics.html.erb"), "app/views/shared/_analytics.html.erb", force: true

      # Add to layout
      inject_into_file 'app/views/layouts/application.html.erb', :before => "</head>" do
        <<-eos
    <%= render "shared/analytics" %>
        eos
      end
    end
  end
end
