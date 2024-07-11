require "tty-prompt"

module DaisyUi
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

  def install_daisy_ui(silent: false, **)
    prompt = TTY::Prompt.new(quiet: true)

    if silent || prompt.yes?("Install DaisyUI via CDN?")
      inject_into_file 'app/views/layouts/application.html.erb', :before => "</head>" do
        <<-eos
  <link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.10/dist/full.min.css" rel="stylesheet" type="text/css" />
        eos
      end
    end

    # Prompt for a theme
    theme = silent ? "light" : prompt.select("Which DaisyUI theme would you like?", DAISY_UI_THEMES, default: "light")

    gsub_file 'app/views/layouts/application.html.erb', /<html>/, "<html data-theme=\"#{theme}\">"
  end
end
