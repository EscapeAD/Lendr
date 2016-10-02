class Item < ApplicationRecord
  has_many :checkouts
  has_many :pictures, inverse_of: :item, dependent: :destroy
  accepts_nested_attributes_for :checkouts
  accepts_nested_attributes_for :pictures, :allow_destroy => true

private
  def self.count_inventory(user_id)
    inventory       = 0
    inventory_total = Item.where(user_id: user_id)
    inventory_total.each do
      inventory += 1
    end
    return inventory
  end

end
