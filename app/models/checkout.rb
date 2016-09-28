class Checkout < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_many   :verifications

  private

  def self.borrow_list(user_id)
    Checkout.where(user_id: user_id)
  end

  def self.lent_out(user_id)
    inventory = Item.where(user_id: user_id)
    list      = []
    checkout  = Checkout.all
    checkout.each do |item|
      inventory.each do |invent_item|
        if item[:item_id] == invent_item[:id] && item[:returned] == false
          list << item
        end
      end
    end
    return list
  end

  def self.pending(user_id)
    inventory = Item.where(user_id: user_id)
    list      = []
    checkout  = Checkout.all
    checkout.each do |item|
      inventory.each do |invent_item|
        if item[:item_id] == invent_item[:id] && item[:check_initial] == false
          list << item
        end
      end
    end
    puts list
    return list
  end

end
