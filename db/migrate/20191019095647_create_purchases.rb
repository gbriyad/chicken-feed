class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.decimal :quantity, precision: 40, scale: 5
      t.decimal :price_per_unit, precision: 40, scale: 5
      t.date :date
      t.references :ingredient, foreign_key: true

      t.timestamps
    end
  end
end
