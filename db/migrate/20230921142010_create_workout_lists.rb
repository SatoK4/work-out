class CreateWorkoutLists < ActiveRecord::Migration[6.1]
  def change
    create_table :workout_lists do |t|

      t.integer :customer_id, null: false
      t.string :name,         null: false
      t.timestamps
    end
  end
end
