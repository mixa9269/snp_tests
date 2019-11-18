# frozen_string_literal: true

class TestSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :title
  has_many :questions, serializer: QuestionSerializer
end
