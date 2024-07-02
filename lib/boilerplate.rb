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

  # class Base
    # included do
      # class_attribute :config
    # end
#
    # class_methods do
      # def inherited(base)
        # base.config = $CONFIG
      # end
    # end
  # end
end
