class Workout < ApplicationRecord
  belongs_to :customer
  has_many :workout_comments
  has_many :workout_tags
  has_many :workout_list_details
  
  mount_uploader :image, ImageUploader
end
