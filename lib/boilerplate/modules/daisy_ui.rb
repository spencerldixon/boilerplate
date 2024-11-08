require "tty-prompt"
require "boilerplate/helpers/js_installer.rb"

module DaisyUi
  include JsInstaller

  DAISY_UI_THEMES = %w(
    light
    dark
    cupcake
    bumblebee
    emerald
    corporate
    synthwave
    retro
    cyberpunk
    valentine
    halloween
    garden
    forest
    aqua
    lofi
    pastel
    fantasy
    wireframe
    black
    luxury
    dracula
    cmyk
    autumn
    business
    acid
    lemonade
    night
    coffee
    winter
    dim
    nord
    sunset
  )

  def install_daisy_ui(silent: false, javascript:, **)
    prompt = TTY::Prompt.new(quiet: true)

    after_bundle do
      if silent || prompt.yes?("Install DaisyUI?")
        install_package_with(javascript.to_sym, "daisyui@latest")

        inject_into_file 'tailwind.config.js', after: "module.exports = {\n" do
          <<-eos
  plugins: [
    require('daisyui')
  ],
          eos
        end

        # Prompt for a theme
        theme = silent ? "light" : prompt.select("Which DaisyUI theme would you like?", DAISY_UI_THEMES, default: "light")

        gsub_file 'app/views/layouts/application.html.erb', /<html>/, "<html data-theme=\"#{theme}\">"
      end
    end
  end
end
