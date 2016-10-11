class RemoveColumnOpenFromMailbox < ActiveRecord::Migration[5.0]
  def change
    remove_column :mailboxes, :open, :boolean
  end
end
