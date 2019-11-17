# frozen_string_literal: true

module AppTests
  class Update < ActiveInteraction::Base
    object :app_test

    string :title
    validates :title, presence: true

    def execute
      app_test.title = title if title?

      errors.merge!(app_test.errors) unless app_test.save

      app_test
    end
  end
end
