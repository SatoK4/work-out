class WorkoutList < ApplicationRecord
  belongs_to :customer
  has_many :workout_list_details
end
