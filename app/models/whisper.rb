class Whisper < ApplicationRecord
  has_many :whisper_comments, dependent: :destroy
  has_many :wisper_bookmarks, dependent: :destroy
  belongs_to :customer
  
  mount_uploaders :images, ImageUploader
  
  def find_bookmark(customer)
    bookmarks.find_by(customer_id: customer.id)
  end
end