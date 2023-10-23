class AddIndexWhisperBookmarksIds < ActiveRecord::Migration[6.1]
  def change
    add_index :whisper_bookmarks, [:customer_id, :whisper_id], unique: true
  end
end
