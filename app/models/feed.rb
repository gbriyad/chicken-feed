class Feed < ApplicationRecord
  belongs_to :batch

  has_many :feed_ingredients, dependent: :destroy
  has_many :ingredients, through: :feed_ingredients, dependent: :restrict_with_error

  validates :feed_quantity_per_chicken, :total_chickens, :date, :days, presence: true
  validate :feed_date_cannot_be_before_batch_date

  scope :chronologize, -> { order(date: :desc) }

  def total_quantity_of_ingredients
    total_chickens * feed_quantity_per_chicken * days
  end

  def total_cost
    sum = 0.0
    feed_ingredients.each do |feed_ingredient|
      sum += feed_ingredient.total_cost
    end
    sum
  end

  def sum_of_all_ingredients_used_in_feed_formulation
    feed_ingredients.sum(:feed_formulation_quantity)
  end

  def populate_ingredients_details_based_on_current_feed_formulation
    ingredients << Ingredient.all
    feed_ingredients.each do |feed_ingredient|
      feed_ingredient.price_per_unit = feed_ingredient.ingredient.last_purchased_price_per_unit
      feed_ingredient.feed_formulation_quantity = feed_ingredient.ingredient.feed_formulation_quantity
      feed_ingredient.save!
    end
  end

  def consume_ingredients_from_stock
    feed_ingredients.each do |feed_ingredient|
      feed_ingredient.ingredient.consume_from_stock(feed_ingredient.total_quantity_needed)
    end
  end

  def rollback_ingredients_consumption
    feed_ingredients.each do |feed_ingredient|
      feed_ingredient.ingredient.add_to_stock(feed_ingredient.total_quantity_needed)
    end
  end

  def needed_ingredients_quantity_in_stock?
    Ingredient.all.each do |ingredient|
      if ingredient.quantity_needed_to_make_a_feed_based_on_current_feed_formulation(total_quantity_of_ingredients) > ingredient.stock_quantity
        return false
      end
    end
    true
  end

  # validations
  def feed_date_cannot_be_before_batch_date
    if batch.present? && date < batch.start_date
      errors.add(:date, 'cannot be less than its batch date')
    end
  end

end
