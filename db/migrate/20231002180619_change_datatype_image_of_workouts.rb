class ChangeDatatypeImageOfWorkouts < ActiveRecord::Migration[6.1]
  def change
    change_column :workouts, :image, :json
  end
end
