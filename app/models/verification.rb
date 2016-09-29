class Verification < ApplicationRecord
  belongs_to :checkout


  def self.verify_show_pickup(input_id)
    Verification.where(checkout_id: input_id, status: 'pickup')[0][:id]
  end

  def self.verify_user(itemId, checkoutsId, verfId, current_user)
    item                 = Item.find(itemId)
    check                = Checkout.find(checkoutsId)
    verification_session = Verification.find(verfId)
    if current_user.id == item.user_id
      verification_session.update_attribute(:owner, true)
      verification_session.save
    else
      verification_session.update_attribute(:borrower, true)
      verification_session.save
    end
  end

  def self.status_text(verfId)
    status = Verification.find(verfId).status
    if status == 'pickup'
      "Verify Pickup Complete"
    else
      "Verify Return Complete"
    end
  end

  

end
