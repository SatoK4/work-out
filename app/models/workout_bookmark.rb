class WorkoutBookmark < ApplicationRecord
  belongs_to :customer
  belongs_to :workout
  
  validates :customer_id, uniqueness: { scope: :workout_id }
end
