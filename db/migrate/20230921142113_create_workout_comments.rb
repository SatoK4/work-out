class CreateWorkoutComments < ActiveRecord::Migration[6.1]
  def change
    create_table :workout_comments do |t|

      t.integer :customer_id, null: false
      t.integer :workout_id,  null: false
      t.string :comment,      null: false
      t.timestamps
    end
  end
end
