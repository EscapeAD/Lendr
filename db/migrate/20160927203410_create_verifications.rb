class CreateVerifications < ActiveRecord::Migration[5.0]
  def change
    create_table :verifications do |t|
      t.references :checkout, foreign_key: true
      t.string :status
      t.boolean :owner
      t.boolean :borrower

      t.timestamps
    end
  end
end
