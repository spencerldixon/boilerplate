# Install DaisyUI 4.12.8 via CDN
# require "tty-prompt"
#
# class DaisyUI < Thor
  # def initialize
  # end
#
  # def install
    # prompt = TTY::Prompt.new

    # if prompt.yes?("Install DaisyUI via CDN?")
module DaisyUi
  def install_daisyui
      inject_into_file 'app/views/layouts/application.html.erb', :before => "</head>" do
        <<-eos
      <link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.8/dist/full.min.css" rel="stylesheet" type="text/css" />
        eos
      end
  end
end
    # end
  # end
# end
#
# DaisyUI.new.install
