# frozen_string_literal: true

module Answers
  class InsertAt < ActiveInteraction::Base
    object :answer
    integer :position

    def execute
      answer.insert_at(position)
    end
  end
end
