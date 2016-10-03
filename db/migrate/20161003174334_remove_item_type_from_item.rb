class RemoveItemTypeFromItem < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :item_type, :string
  end
end
