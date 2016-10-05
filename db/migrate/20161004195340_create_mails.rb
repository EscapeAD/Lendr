class CreateMails < ActiveRecord::Migration[5.0]
  def change
    create_table :mails do |t|
      t.string :title
      t.integer :sender
      t.integer :recipient
      t.boolean :open
      t.text :text

      t.timestamps
    end
  end
end
