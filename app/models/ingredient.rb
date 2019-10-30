class Ingredient < ApplicationRecord
  has_many :purchases, dependent: :restrict_with_error
  has_many :feed_ingredients, dependent: :restrict_with_error
  has_many :feeds, through: :feed_ingredients, dependent: :restrict_with_error
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :feed_formulation_quantity, presence: true

  def self.sum_of_all_ingredients_used_in_feed_formulation
    Ingredient.sum(:feed_formulation_quantity)
  end

  def units_needed_to_make_a_feed(total_units_of_feed)
    feed_formulation_quantity / Ingredient.sum_of_all_ingredients_used_in_feed_formulation * total_units_of_feed
  end

  def consume(units)
    new_stock = stock_quantity - units
    update_attributes(stock_quantity: new_stock)
  end

end
