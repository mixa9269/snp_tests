class AppTest < ApplicationRecord
  has_many :questions, -> { order(created_at: :asc) }, dependent: :destroy
end
