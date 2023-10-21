class ChangeDataCommentToWhisperComments < ActiveRecord::Migration[6.1]
  def change
    change_column :whisper_comments, :comment, :text
  end
end
