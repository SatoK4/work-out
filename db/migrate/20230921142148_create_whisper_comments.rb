class CreateWhisperComments < ActiveRecord::Migration[6.1]
  def change
    create_table :whisper_comments do |t|

      t.integer :whisper_id,  null: false
      t.integer :customer_id, null: false
      t.string :comment,      null: false
      t.timestamps
    end
  end
end
