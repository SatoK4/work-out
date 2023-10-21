class ChangeDataContentToWhispers < ActiveRecord::Migration[6.1]
  def change
    change_column :whispers, :content, :text
  end
end
