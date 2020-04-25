# frozen_string_literal: true

module Answers
  class Update < ActiveInteraction::Base
    include ApplicationHelper

    object :answer
    string :text, :is_right
    boolean :is_right, default: false
    validates :text, presence: true

    def execute
      answer.text = text if text
      answer.is_right = is_right if is_right.present?

      errors.merge!(answer.errors) unless answer.save

      answer
    end
  end
end
