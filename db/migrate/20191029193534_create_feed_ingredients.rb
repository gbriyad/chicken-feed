class CreateFeedIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :feed_ingredients do |t|
      t.references :feed, foreign_key: true
      t.references :ingredient, foreign_key: true
      t.decimal :price
      t.decimal :quantity

      t.timestamps
    end
  end
end
