require "boilerplate/modules/daisy_ui.rb"
require "boilerplate/modules/devise.rb"
require "boilerplate/modules/bullet.rb"

MODULES = %w(
  DaisyUi
  Devise
  Bullet
)

class Omakase
  def initialize(generator:)
    @generator = generator
    @options = @generator.options

    # Extend the generator with our chosen modules
    MODULES.each do |module_name|
      @generator.extend(Kernel.const_get(module_name))
    end
  end

  def install!
    # Call .install_module_name for each module with the silent: true arg to skip prompts
    # MODULES.each do |module_name|
      # @generator.send("install_#{module_name.gsub(/(.)([A-Z])/,'\1_\2').downcase}", silent: true)
    # end

    @generator.install_daisy_ui
    @generator.install_devise
    @generator.install_bullet
  end
end

Omakase.new(generator: self).install!
