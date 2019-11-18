class Question < ApplicationRecord
  belongs_to :app_test
  enum question_type: %i[single multiple number]
end
