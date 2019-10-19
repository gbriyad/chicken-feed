class Ingredient < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :feed_formulation_quantity, presence: true
end
