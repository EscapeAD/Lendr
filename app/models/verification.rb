class Verification < ApplicationRecord
  belongs_to :checkout


  def self.verify_show_pickup(input_id)
    Verification.where(checkout_id: input_id, status: 'pickup')[0][:id]
  end

  def self.verify_user(itemId, checkoutsId, verfId)
    item_owner           = Item.find(itemId)
    check                = Checkout.find(checkoutsId)
    verification_session = Verification.find(verfId)
    if current_user.id == item_owner.id
      verification_session.update_attribute(:lender, true)
    else
      verification_session.update_attribute(:borrower, true)
    end
  end

end
