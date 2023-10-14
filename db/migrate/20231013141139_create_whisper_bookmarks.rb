class CreateWhisperBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :whisper_bookmarks do |t|
      t.integer :whisper_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
