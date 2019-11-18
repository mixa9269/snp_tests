# frozen_string_literal: true

class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :text, :is_right
end
