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

  #Check both owner and borrower verified the Verification
  #Update checkout session start date to current date and due_date to 2 weeks after
  def self.verify_staging(verfId)
    verification_session = Verification.find(verfId)
    checkout_session = Checkout.find(verification_session.checkout_id)
    if verification_session[:owner] == true && verification_session[:borrower] == true && verification_session[:status] == 'pickup'
      checkout_session.update_attributes(start_date:  Time.now, due_date: Time.now + 14.days)
      verification_session.update_attributes(status: 'return', owner: 'false', borrower: 'false')
      checkout_session.save
      verification_session.save
    end

    if verification_session[:owner] == true && verification_session[:borrower] == true && verification_session[:status] == 'return'
      checkout_session.update_attribute(:returned, true)
      checkout_session.save
      verification_session.destroy
    end


  end


end
