module Boilerplate
  class Installer
    def initialize
    end

    def run
      # require stuff to run here
      require_relative "./modules/hello.rb"
    end
  end
end

Boilerplate::Installer.new($CONFIG).run
