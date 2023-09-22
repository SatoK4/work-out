class WorkoutComment < ApplicationRecord
  belongs_to :customer
  belongs_to :workout
end
