class VerificationsController < ApplicationController
  def show
    @verify = Verification.find(params[:id])
    @status_text = Verification.status_text(params[:id])
    @owner_of_item   = Item.find(params[:item_id])
  end

  def new

  end

  def update
    Verification.verify_user(params[:item_id],params[:checkout_id],params[:id],current_user)
    @verification_id = Verification.find_by(checkout_id: params[:checkout_id], status: 'pickup')
    @verify = Verification.find(params[:id])
    Verification.verify_staging(@verify.id)


    # if @verify == nil
      # redirect_to user_url(current_user.id)
    # end

    # redirect_to item_checkout_verification_url(params[:item_id], params[:id], @verification_id)


  end

  def create

  end

end
