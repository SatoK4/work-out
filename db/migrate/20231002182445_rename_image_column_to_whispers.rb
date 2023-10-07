class RenameImageColumnToWhispers < ActiveRecord::Migration[6.1]
  def change
    rename_column :whispers, :image, :images
  end
end
