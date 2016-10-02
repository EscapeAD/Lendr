class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.references :checkout, foreign_key: true
      t.text :story
      t.datetime :date

      t.timestamps
    end
  end
end
