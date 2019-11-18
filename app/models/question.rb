class Question < ApplicationRecord
  belongs_to :app_test
  has_many :answers, dependent: :destroy
  enum question_type: %i[single multiple number]
end
