# frozen_string_literal: true

class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :question_type, :answer, :answers
  
  def answers
    object.answers.map do |answer|
      AnswerSerializer.new(answer, scope: scope, root: false, event: object)
    end
  end
end
