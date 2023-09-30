class DestroyActiveStorageTables < ActiveRecord::Migration[6.1]
  drop_table :active_storage_blobs
  drop_table :active_storage_attachments
end
