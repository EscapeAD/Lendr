class VerificationsController < ApplicationController
  def show
    @verify = Verification.find(params[:id])
    @status_text = Verification.status_text(params[:id])
    @user   = Item.find(params[:item_id])




  end

  def new

  end

  def update

    @verify = Verification.find(params[:id])
    # Verification.verify_user(params[:item_id],params[:checkout_id],params[:id])
    # CHECK FOR WHO IS current_user ..
    item_owner           = Item.find(params[:item_id])
    check                = Checkout.find(params[:checkout_id])
    verification_session = Verification.find(params[:id])

    if current_user.id == item_owner.user_id
      verification_session.update_attribute(:owner, true)
      verification_session.save
    else
      verification_session.update_attribute(:borrower, true)
      verification_session.save
    end
    redirect_to item_checkout_verification_path(params[:item_id],params[:checkout_id],params[:id])

  end

  def create

  end

end
