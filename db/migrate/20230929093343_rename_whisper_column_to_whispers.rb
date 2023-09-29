class RenameWhisperColumnToWhispers < ActiveRecord::Migration[6.1]
  def change
    rename_column :whispers, :whisper, :content
  end
end
