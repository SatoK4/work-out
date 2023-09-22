class CreateWorkoutTags < ActiveRecord::Migration[6.1]
  def change
    create_table :workout_tags do |t|

      t.integer :workout_id, null: false
      t.integer :tag_id, null: false
      t.timestamps
    end
  end
end
