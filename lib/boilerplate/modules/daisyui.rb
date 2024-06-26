# Install DaisyUI 4.12.8 via CDN
require "tty-prompt"

prompt = TTY::Prompt.new

if CONFIG[:silent_mode] || prompt.yes?("Install DaisyUI via CDN?")
  inject_into_file 'app/views/layouts/application.html.erb', :before => "</head>" do
    <<--eos
    "<link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.8/dist/full.min.css" rel="stylesheet" type="text/css" />"
    eos
  end
end
