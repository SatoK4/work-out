class DestroyActiveStorageTables < ActiveRecord::Migration[6.1]
  drop_table :active_storage_variant_records
  drop_table :active_storage_attachments
  drop_table :active_storage_blobs
end
