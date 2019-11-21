# frozen_string_literal: true

module Questions
  class Update < ActiveInteraction::Base
    include ApplicationHelper

    object :question
    string :title, :question_type
    integer :answer, default: nil
    validates :title, :question_type, presence: true
    validate :validate_question_type

    def execute
      question.title = title if title
      question.question_type = question_type if question_type
      question.answer = answer if answer

      errors.merge!(question.errors) unless question.save

      question
    end

    def validate_question_type
      raise Exceptions::InvalidQuestionType unless check_question_type(question_type)
    end
  end
end
