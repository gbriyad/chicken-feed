class Feed < ApplicationRecord
  belongs_to :batch

  has_many :feed_ingredients, dependent: :destroy
  has_many :ingredients, through: :feed_ingredients, dependent: :restrict_with_error

  validates :feed_quantity_per_chicken, :total_chickens, :date, presence: true
  validate :feed_date_cannot_be_before_batch_date

  def feed_date_cannot_be_before_batch_date
    if batch.present? && date < batch.start_date
      errors.add(:date, 'cannot be less than its batch date')
    end
  end

  before_create do
    # check current stock of ingredients
    total_units_of_feed_needed = total_chickens * feed_quantity_per_chicken
    Ingredient.all.each do |ingredient|
      if ingredient.units_needed_to_make_a_feed(total_units_of_feed_needed) > ingredient.stock_quantity
        throw :abort
      end
    end
  end

  after_create do
    # add current ingredient price and feed formulation detail for the feed
    total_units_of_feed_needed = total_chickens * feed_quantity_per_chicken
    ingredients << Ingredient.all
    feed_ingredients.each do |feed_ingredient|
      feed_ingredient.price_per_unit = feed_ingredient.ingredient.last_purchased_price_per_unit
      feed_ingredient.ingredient.consume_from_stock(feed_ingredient.ingredient.units_needed_to_make_a_feed(total_units_of_feed_needed))
    end
  end
end
