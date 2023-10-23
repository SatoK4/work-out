class Whisper < ApplicationRecord
  has_many :whisper_comments, dependent: :destroy
  has_many :whisper_bookmarks, dependent: :destroy
  belongs_to :customer

  mount_uploaders :images, ImageUploader

  def find_bookmark(customer)
    whisper_bookmarks.find_by(customer_id: customer.id)
  end
end