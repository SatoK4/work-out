class Tag < ApplicationRecord
  has_many :workout_tags, dependent: :destroy
  has_many :workouts, through: :workout_tags

  validates :tag_name, presence: true
end
