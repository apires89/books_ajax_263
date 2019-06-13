class Review < ApplicationRecord
  belongs_to :book
  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: (1..5) }, numericality: true

  def self.ordered_by_date
    order(created_at: :desc)
  end
end
