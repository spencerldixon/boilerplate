require "tty-prompt"

module HomePage
  FILES_PATH = File.join(Gem.loaded_specs["boilerplate"].full_gem_path, "lib", "boilerplate", "files")

  def install_home_page(silent: false, **)
    prompt = TTY::Prompt.new(quiet: true)

    if silent || prompt.yes?("Generate a home page in static_pages/index and set it to root?")
      # add controller action (no need to add route)
      # copy view
      # copy route...
      # ask where to route the logged in path to? or make it a todo
      #  devise_scope :user do
      #      unauthenticated do
      #            root to: "static_pages#index"
      #                end
      #
      #                    authenticated do
      #                          root to: "bookmarks#index", as: :authenticated_root
      #                              end
      #                                end

    elsif prompt.yes?("Set app root to /users/sign_in?")
      route "root to: 'devise/sessions#new'"
    end
  end
end
