class Item < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

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
