class Checkout < ApplicationRecord
  belongs_to :user
  belongs_to :item

  private
  
  def self.borrow_list(user_id)
    Checkout.where(user_id: user_id)
  end

end
