class AddIndexWorkoutBookmarksIds < ActiveRecord::Migration[6.1]
  def change
    add_index :workout_bookmarks, [:customer_id, :workout_id], unique: true
  end
end
