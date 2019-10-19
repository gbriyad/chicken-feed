class Purchase < ApplicationRecord
  belongs_to :ingredient
  validates :quantity, :price_per_unit, :date, presence: true
end
