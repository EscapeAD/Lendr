class AddColumnUnreadToMailbox < ActiveRecord::Migration[5.0]
  def change
    add_column :mailboxes, :unread, :boolean, default: true
  end
end
