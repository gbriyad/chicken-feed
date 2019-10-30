class CreateFeedIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :feed_ingredients do |t|
      t.references :feed, foreign_key: true
      t.references :ingredient, foreign_key: true
      t.decimal :price_per_unit
      t.decimal :feed_formulation_quantity

      t.timestamps
    end
  end
end
