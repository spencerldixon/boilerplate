require "tty-prompt"

module DaisyUi
  def install_daisy_ui(silent: false)
    prompt = TTY::Prompt.new

    if silent || prompt.yes?("Install DaisyUI via CDN?")
      inject_into_file 'app/views/layouts/application.html.erb', :before => "</head>" do
        <<-eos
  <link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.10/dist/full.min.css" rel="stylesheet" type="text/css" />
        eos
      end
    end
  end
end
