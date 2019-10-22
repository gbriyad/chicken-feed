class CreateShades < ActiveRecord::Migration[5.2]
  def change
    create_table :shades do |t|
      t.string :name
      t.references :branch, foreign_key: true

      t.timestamps
    end
  end
end
