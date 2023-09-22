class WorkoutListDetail < ApplicationRecord
  belongs_to :workout
  belongs_to :workout_list
end
