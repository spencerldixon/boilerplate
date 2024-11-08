require "tty-prompt"
require "boilerplate/helpers/js_installer.rb"

module FontAwesome
  include JsInstaller

  def install_font_awesome(silent: false, javascript:, **)
    prompt = TTY::Prompt.new(quiet: true)

    after_bundle do
      if silent || prompt.yes?("Install FontAwesome?")
        install_package_with(javascript.to_sym, "@fortawesome/fontawesome-free")

        append_to_file 'app/javascript/application.js' do
          <<-eos
import "@fortawesome/fontawesome-free";
          eos
        end
      end
    end
  end
end
