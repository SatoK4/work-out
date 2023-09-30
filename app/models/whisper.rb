class Whisper < ApplicationRecord
  has_many :whisper_comments
  has_many :bookmarks
  belongs_to :customer
  
  mount_uploader :image, ImageUploader
end
