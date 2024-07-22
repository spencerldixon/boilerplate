require 'boilerplate/modules/daisy_ui.rb'
require 'boilerplate/modules/devise.rb'
require 'boilerplate/modules/bullet.rb'
require 'boilerplate/modules/metatags.rb'
require 'boilerplate/modules/legal_pages.rb'
require 'boilerplate/modules/analytics.rb'
require 'boilerplate/modules/font_awesome.rb'
require 'boilerplate/modules/robots.rb'
require 'boilerplate/modules/remove_trailing_slashes.rb'
require 'boilerplate/modules/good_job.rb'
require 'boilerplate/modules/gitignore.rb'
require 'pp'

MODULES = %w(
  DaisyUi
  Devise
  Bullet
  Metatags
  LegalPages
  Analytics
  FontAwesome
  Robots
  RemoveTrailingSlashes
  GoodJob
  Seeds
  Gitignore
)

# Since this file runs in the context of the rails generator, get the config from the main scope of our cli (bin/boilerplate)


class Omakase
  def initialize(generator:)
    @generator = generator
    @app_name = @generator.send(:app_name) # Send as this is a private method

    # Define options to be passed to each module
    @options = @generator.options.merge({
      app_name: @app_name,
      silent: ARGV.include?("--boilerplate-silent=true")
    }).transform_keys(&:to_sym)

    # Extend the generator with our chosen modules
    MODULES.each do |module_name|
      @generator.extend(Kernel.const_get(module_name))
    end
  end

  def install!
    # Call .install_module_name for each module and splat in the @options hash as keyword argss
    MODULES.each do |module_name|
      @generator.send("install_#{module_name.gsub(/(.)([A-Z])/,'\1_\2').downcase}", **@options)
    end
  end
end

Omakase.new(generator: self).install!
