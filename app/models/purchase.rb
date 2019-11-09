# warnings
# editing/deleting old purchases should be restricted
# if any feed has been created after that particular purchase
class Purchase < ApplicationRecord
  belongs_to :ingredient
  validates :quantity, :price_per_unit, :date, presence: true

  scope :chronologize, -> { order(date: :desc) }

  after_create do
    update_ingredient_information price_per_unit, quantity
  end

  after_update do
    change = saved_change_to_attribute :quantity
    update_ingredient_information price_per_unit, change[1] - change[0]
  end

  after_destroy do
    update_ingredient_information nil, -quantity
  end

  def update_ingredient_information(price_per_unit, quantity_to_be_added)
    if price_per_unit.present?
      ingredient.update_last_purchased_price_per_unit(price_per_unit)
    end
    ingredient.add_to_stock(quantity_to_be_added)
  end
end
