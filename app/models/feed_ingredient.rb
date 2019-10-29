class FeedIngredient < ApplicationRecord
  belongs_to :feed
  belongs_to :ingredient
end
