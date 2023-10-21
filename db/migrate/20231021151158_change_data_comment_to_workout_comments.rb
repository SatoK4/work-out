class ChangeDataCommentToWorkoutComments < ActiveRecord::Migration[6.1]
  def change
    change_column :workout_comments, :comment, :text
  end
end
