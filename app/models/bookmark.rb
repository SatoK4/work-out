class Bookmark < ApplicationRecord
  belongs_to :whisper
  belongs_to :customer
end
