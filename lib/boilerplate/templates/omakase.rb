require "boilerplate/modules/daisy_ui.rb"
require "boilerplate/modules/devise.rb"
require "boilerplate/modules/bullet.rb"
require "boilerplate/modules/metatags.rb"

require 'pp'

MODULES = %w(
  DaisyUi
  Devise
  Bullet
  Metatags
)

class Omakase
  def initialize(generator:)
    @generator = generator
    @options = @generator.options
    @app_name = @generator.send(:app_name) # Send as this is a private method

    # Extend the generator with our chosen modules
    MODULES.each do |module_name|
      @generator.extend(Kernel.const_get(module_name))
    end
  end

  def install!
    # Call .install_module_name for each module with the silent: true arg to skip prompts
    # MODULES.each do |module_name|
      # @generator.send("install_#{module_name.gsub(/(.)([A-Z])/,'\1_\2').downcase}", **options)
    # end

    @generator.install_daisy_ui(silent: true)
    @generator.install_devise(silent: true)
    @generator.install_bullet(silent: true)
    @generator.install_metatags(silent: true, app_name: @app_name)
  end
end

Omakase.new(generator: self).install!
