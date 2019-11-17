# frozen_string_literal: true

module AppTests
  class Create < ActiveInteraction::Base
    string :title, :scope_key
    validates :title, :scope_key, presence: true

    def execute
      test = AppTest.new(inputs)

      errors.merge!(test.errors) unless test.save

      test
    end
  end
end
