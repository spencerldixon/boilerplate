require "tty-prompt"

module LegalPages
  FILES_PATH = File.join(Gem.loaded_specs["boilerplate"].full_gem_path, "lib", "boilerplate", "files")

  def install_legal_pages(silent: false, **)
    prompt = TTY::Prompt.new(quiet: true)

    if silent || prompt.yes?("Install boilerplate /privacy and /terms_and_condition pages?")
      rails_command "g controller static_pages privacy terms_and_conditions"

      gsub_file "config/routes.rb", /get \'static_pages\/privacy\'\n/, ""
      gsub_file "config/routes.rb", /get \'static_pages\/terms_and_conditions\'/, ""

      route "get '/privacy', to: 'static_pages#privacy'"
      route "get '/terms_and_conditions', to: 'static_pages#terms_and_conditions'"

      template File.join(FILES_PATH, "app/views/static_pages/privacy.html.erb"), "app/views/static_pages/privacy.html.erb", force: true
      template File.join(FILES_PATH, "app/views/static_pages/terms_and_conditions.html.erb"), "app/views/static_pages/terms_and_conditions.html.erb", force: true

      # TODO - add/uncomment to footer
    end
  end
end
