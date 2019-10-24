class CreateBatches < ActiveRecord::Migration[5.2]
  def change
    create_table :batches do |t|
      t.string :name
      t.date :start_date
      t.references :shade, foreign_key: true

      t.timestamps
    end
  end
end
