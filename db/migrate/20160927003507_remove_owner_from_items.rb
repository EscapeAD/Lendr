class RemoveOwnerFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :owner_id, :string
  end
end
