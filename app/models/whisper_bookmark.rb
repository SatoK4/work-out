class WhisperBookmark < ApplicationRecord
  belongs_to :customer
  belongs_to :whisper
  
  validates :customer_id, uniqueness: { scope: :whisper_id }
end
