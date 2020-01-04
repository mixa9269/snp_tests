class Answer < ApplicationRecord
  belongs_to :question
  acts_as_list scope: :question, top_of_list: 0
  default_scope { order(position: :asc) }
end
