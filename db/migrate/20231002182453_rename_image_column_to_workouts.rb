class RenameImageColumnToWorkouts < ActiveRecord::Migration[6.1]
  def change
    rename_column :workouts, :image, :images
  end
end
