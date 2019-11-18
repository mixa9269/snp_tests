class AppTest < ApplicationRecord
  has_many :questions, dependent: :destroy
end
