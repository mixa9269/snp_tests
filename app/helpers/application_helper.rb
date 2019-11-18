# frozen_string_literal: true

module ApplicationHelper
  def check_question_type(str)
    Question.question_types.include?(str)
  end
end
