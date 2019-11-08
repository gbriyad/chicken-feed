class FeedIngredient < ApplicationRecord
  belongs_to :feed
  belongs_to :ingredient

  def total_quantity_needed
    feed_formulation_quantity / feed.sum_of_all_ingredients_used_in_feed_formulation * feed.total_chickens * feed.feed_quantity_per_chicken
  end

  def total_cost
    total_quantity_needed * price_per_unit
  end
end
