class CreateWorkoutBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :workout_bookmarks do |t|
      t.integer :workout_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
