class CreateWorkoutListDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :workout_list_details do |t|

      t.integer :workout_id,      null: false
      t.integer :workout_list_id, null: false
      t.string :name,             null: false
      t.integer :position,        null: false
      t.integer :timer,           null: false
      t.timestamps
    end
  end
end
