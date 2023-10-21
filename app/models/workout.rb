class Workout < ApplicationRecord
  belongs_to :customer
  has_many :workout_comments, dependent: :destroy
  has_many :workout_tags
  has_many :tags, through: :workout_tags
  has_many :workout_list_details
  has_many :workout_bookmarks

  def self.search(keyword)
    where("name LIKE ? or introduction LIKE ?", "%#{keyword}%", "%#{keyword}%")
  end
end
