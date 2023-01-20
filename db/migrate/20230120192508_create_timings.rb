class CreateTimings < ActiveRecord::Migration[7.0]
  def change
    create_table :timings do |t|
      t.string :meal
      t.date :date
      t.integer :food_id

      t.timestamps
    end
  end
end
