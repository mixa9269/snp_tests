# frozen_string_literal: true

module Questions
  class Create < ActiveInteraction::Base
    include ApplicationHelper

    object :app_test
    string :title, :question_type
    integer :answer, default: nil
    validates :title, :question_type, presence: true
    validate :validate_question_type

    def execute
      outcome = app_test.questions.build(title: title, answer: answer, question_type: question_type)

      errors.merge!(outcome.errors) unless outcome.save

      outcome
    end

    def validate_question_type
      raise Exceptions::InvalidQuestionType unless check_question_type(question_type)
    end
  end
end