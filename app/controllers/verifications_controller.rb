class VerificationsController < ApplicationController
  def show
    @verify = Verification.find(params[:id])
    @status_text = Verification.status_text(params[:id])
    @owner_of_item   = Item.find(params[:item_id])
  end

  def new

  end

  def update

    @verify = Verification.find(params[:id])
    Verification.verify_user(params[:item_id],params[:checkout_id],params[:id],current_user)

    Verification.verify_staging(@verify.id)

    if @verify == nil
      redirect_to user_path
    end



  end

  def create

  end

end
