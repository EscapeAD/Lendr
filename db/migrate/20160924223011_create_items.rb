class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :type
      t.text :description
      t.integer :owner_id
      t.string :image

      t.timestamps
    end
  end
end
