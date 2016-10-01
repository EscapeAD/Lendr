class AddItemToPictures < ActiveRecord::Migration[5.0]
  def change
    add_reference :pictures, :item, foreign_key: true
  end
end
