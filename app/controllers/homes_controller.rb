class HomesController < ApplicationController
  def top
    @workout_bookmark_ranks = Workout.find(WorkoutBookmark.group(:workout_id).order(Arel.sql('count(workout_id)desc')).pluck(:workout_id))
    # orderの後にArel.sql('count...')を入れるとエラーが別のものになる
  end
end
