require "tty-prompt"

module FontAwesome
  def install_font_awesome(silent: false, javascript:, **)
    prompt = TTY::Prompt.new(quiet: true)

    after_bundle do
      if silent || prompt.yes?("Install FontAwesome?")
        case javascript.to_sym
        when :importmap
          run "./bin/importmap pin @fortawesome/fontawesome-free"
        when :bun
          run "bun add @fortawesome/fontawesome-free"
        else
          run "npm install @fortawesome/fontawesome-free"
        end

        append_to_file 'app/javascript/application.js' do
          <<-eos
import "@fortawesome/fontawesome-free";
          eos
        end
      end
    end
  end
end
