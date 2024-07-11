require "boilerplate/modules/daisy_ui.rb"

MODULES = %w( 
  DaisyUi
)

class Omakase
  def initialize(generator:)
    @generator = generator
    @options = @generator.options
    @database = @options.database
    @asset_pipeline = @options.asset_pipeline
    @api = @options.api
    @javascript = @options.javascript

    # Extend the generator with our chosen modules
    MODULES.each do |module_name|
      @generator.extend(Kernel.const_get(module_name))
    end
  end

  def install!
    # Call .install_module_name for each module with the silent: true arg to skip prompts
    MODULES.each do |module_name|
      @generator.send("install_#{module_name.gsub(/(.)([A-Z])/,'\1_\2').downcase}", silent: true)
    end
  end
end

Omakase.new(generator: self).install!
