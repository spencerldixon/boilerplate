# frozen_string_literal: true

require_relative "boilerplate/version"
require 'singleton'

module Boilerplate
  class Error < StandardError; end

  class Config
    include Singleton

    @@silent = false

    def self.silent
      @@silent
    end
  end
end
