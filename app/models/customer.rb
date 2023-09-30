class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :workouts
  has_many :workout_comments
  has_many :workout_lists
  has_many :whispers
  has_many :whisper_comments
  has_many :bookmarks

  has_one_attached :image

  def status
    if is_deleted == false
      "有効"
    else
      "無効"
    end
  end
end
