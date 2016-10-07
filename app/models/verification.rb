class Verification < ApplicationRecord
  belongs_to :checkout
  has_many :messages
  has_many :users, through: :messages


  def self.verify_show_pickup(input_id)
    Verification.where(checkout_id: input_id, status: 'pickup')[0][:id]
  end

  def self.verify_show_return(input_id)
    Verification.where(checkout_id: input_id, status: 'return')[0][:id]
  end

  def self.verify_user(current_item_id, current_checkout_id, current_verification_id, current_user)
    item                 = Item.find(current_item_id)
    check                = Checkout.find(current_checkout_id)
    verification_session = Verification.find(current_verification_id)
    if current_user.id == item.user_id
      verification_session.update_attribute(:owner, true)
      verification_session.save
    else
      verification_session.update_attribute(:borrower, true)
      verification_session.save
    end

  end

  def self.status_text(verf_id)
    status = Verification.find(verf_id).status
    if status == 'pickup'
      'Verify Pickup Complete'
    else
      'Verify Return Complete'
    end
  end

  # Check both owner and borrower verified the Verification
  # Update checkout session start date to current date and due_date to 2 weeks after
  def self.verify_staging(current_verification)
    return_time = Time.now + 14.days
    verification_session = Verification.find(current_verification.id)
    checkout_session = Checkout.find(verification_session.checkout_id)
    if verification_session[:owner] == true && verification_session[:borrower] == true && verification_session[:status] == 'pickup'
      checkout_session.update_attributes(start_date:  Time.now, due_date: return_time)
      verification_session.update_attributes(status: 'return', owner: 'false', borrower: 'false')
      checkout_session.save
      verification_session.save
    end
    if verification_session[:owner] == true && verification_session[:borrower] == true && verification_session[:status] == 'return'
      checkout_session.update_attribute(:returned, true)
      checkout_session.stories.new(checkout_id: checkout_session.id)
      checkout_session.save
      Message.where(verification_id: current_verification.id).destroy_all
      Message.where(verification_id: current_verification.id).save
      verification_session.destroy
      verification_session.save
    end
  end
end
