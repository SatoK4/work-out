class Workout < ApplicationRecord
  belongs_to :customer
  has_many :workout_comments
  has_many :workout_tags
  has_many :workout_list_details
  
  has_one_attached :image
end
