# frozen_string_literal: true

class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :title, :question_type, :answer
end
