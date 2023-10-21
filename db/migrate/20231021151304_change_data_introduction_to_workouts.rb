class ChangeDataIntroductionToWorkouts < ActiveRecord::Migration[6.1]
  def change
    change_column :workouts, :introduction, :text
  end
end
