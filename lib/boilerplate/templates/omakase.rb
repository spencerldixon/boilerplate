# MODULES_PATH = File.join(Gem.loaded_specs["boilerplate"].full_gem_path, "lib", "boilerplate", "modules")
class Omakase
  def initialize()
  end

  def install
    # require "#{MODULES_PATH}/daisyui.rb"
  end
end

Omakase.new($CONFIG).install
