class Review < ApplicationRecord
  belongs_to :cocktail

  validates :rating, presence: true, inclusion: { in: (1..5).to_a }
end
