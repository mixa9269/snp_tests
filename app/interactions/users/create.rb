# frozen_string_literal: true

module Users
  class Create < ActiveInteraction::Base
    string :username, :password, :password_confirmation
    boolean :is_admin, default: false

    def execute
      outcome = User.new(inputs)

      errors.merge!(outcome.errors) unless outcome.save

      outcome
    end
  end
end
