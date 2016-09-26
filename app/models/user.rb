class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private

  def self.count_inventory(user_id)
    inventory       = 0
    inventory_total = Items.where(owner_id: user_id)
    inventory.each do |x|
      inventory += 1
    end
    return inventory
  end

end
