class WhisperComment < ApplicationRecord
  belongs_to :whisper
  belongs_to :customer
  
  validates :comment, presence: true
end
