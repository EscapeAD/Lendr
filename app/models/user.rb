class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :owned_items, class_name: 'Item'
  private

  def self.count_inventory(user_id)
    inventory       = 0
    inventory_total = Item.where(user_id: user_id)
    inventory_total.each do
      inventory += 1
    end
    return inventory
  end

  def self.borrow_list(user_id)
    Checkout.where(user_id: user_id)
  end

end
