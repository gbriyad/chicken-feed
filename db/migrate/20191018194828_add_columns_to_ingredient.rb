class AddColumnsToIngredient < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :stock_quantity, :decimal, precision: 40, scale: 5, default: 0
    add_column :ingredients, :feed_formulation_quantity, :decimal, precision: 40, scale: 5, default: 0
    add_column :ingredients, :last_purchased_price_per_unit, :decimal, precision: 40, scale: 5, default: 0
  end
end
