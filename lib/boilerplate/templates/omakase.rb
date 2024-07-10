require "boilerplate/templates/daisyui.rb"

class Omakase
  def initialize(generator:)
    @generator = generator
    @options = @generator.options

    @generator.extend(DaisyUi)
  end

  def install!
    puts @generator.inspect
   # @generator.install_daisyui
  end
end

Omakase.new(generator: self).install!
