class CreateFeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :feeds do |t|
      t.date :date
      t.integer :total_chickens
      t.decimal :feed_quantity_per_chicken
      t.references :batch, foreign_key: true

      t.timestamps
    end
  end
end
