class Ingredient < ApplicationRecord
  has_many :purchases, dependent: :restrict_with_error
  has_many :feed_ingredients, dependent: :restrict_with_error
  has_many :feeds, through: :feed_ingredients, dependent: :restrict_with_error
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :feed_formulation_quantity, presence: true
end
