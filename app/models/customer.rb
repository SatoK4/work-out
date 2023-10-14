class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :workouts, dependent: :destroy
  has_many :workout_comments, dependent: :destroy
  has_many :workout_lists, dependent: :destroy
  has_many :workout_bookmarks, dependent: :destroy
  has_many :whispers, dependent: :destroy
  has_many :whisper_comments, dependent: :destroy
  has_many :whisper_bookmarks, dependent: :destroy

  mount_uploader :image, ImageUploader

  def status
    if is_deleted == false
      "有効"
    else
      "無効"
    end
  end
end
