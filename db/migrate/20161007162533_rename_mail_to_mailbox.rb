class RenameMailToMailbox < ActiveRecord::Migration[5.0]
  def change
    rename_table :mails, :mailboxes
  end
end
