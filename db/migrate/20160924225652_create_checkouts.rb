class CreateCheckouts < ActiveRecord::Migration[5.0]
  def change
    create_table :checkouts do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.datetime :due_date
      t.datetime :start_date
      t.boolean :returned, default: false
      t.datetime :returned_date

      t.timestamps
    end
  end
end
