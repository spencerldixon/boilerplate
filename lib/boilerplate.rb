# frozen_string_literal: true

require_relative "boilerplate/version"

module Boilerplate
  class Error < StandardError; end

  class Config
    def initialize(prompt: true, js: :importmaps)
      @prompt = prompt
      @js = js
    end
  end
end
