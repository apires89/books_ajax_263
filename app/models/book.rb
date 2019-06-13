class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy

  def average_rating
    reviews.average(:rating)
  end
end
