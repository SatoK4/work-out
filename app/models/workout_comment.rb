class WorkoutComment < ApplicationRecord
  belongs_to :customer
  belongs_to :workout
  
  validates :comment, presence: true
end
