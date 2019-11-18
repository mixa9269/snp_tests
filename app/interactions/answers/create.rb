# frozen_string_literal: true

module Answers
  class Create < ActiveInteraction::Base
    include ApplicationHelper

    object :question
    string :text, :is_right
    boolean :is_right, default: false
    validates :text, presence: true

    def execute
      outcome = question.answers.build(text: text, is_right: is_right)

      errors.merge!(outcome.errors) unless outcome.save

      outcome
    end
  end
end