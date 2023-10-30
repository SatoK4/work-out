class Workout < ApplicationRecord
  belongs_to :customer
  has_many :workout_comments, dependent: :destroy
  has_many :workout_tags
  has_many :tags, through: :workout_tags
  has_many :workout_list_details
  has_many :workout_bookmarks, dependent: :destroy
  
  validates :name, presence: true
  validates :introduction, presence: true

  mount_uploaders :images, ImageUploader

  def find_bookmark(customer)
    workout_bookmarks.find_by(customer_id: customer.id)
  end

  def self.search(keyword)
    where("name LIKE ? or introduction LIKE ?", "%#{sanitize_sql_like(keyword)}%", "%#{sanitize_sql_like(keyword)}%")
  end
end
