class CreateWhispers < ActiveRecord::Migration[6.1]
  def change
    create_table :whispers do |t|

      t.integer :customer_id, null: false
      t.string :whisper,      null: false
      t.timestamps
    end
  end
end
