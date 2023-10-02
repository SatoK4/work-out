class ChangeDatatypeImageOfWhispers < ActiveRecord::Migration[6.1]
  def change
    change_column :whispers, :image, :json
  end
end
