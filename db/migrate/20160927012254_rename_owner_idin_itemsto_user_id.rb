class RenameOwnerIdinItemstoUserId < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :owner_id, :user_id
  end
end
