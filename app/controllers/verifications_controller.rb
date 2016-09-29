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
    Verification.verify_user(params[:item_id],params[:checkout_id],params[:id],current_user)



  end

  def create

  end

end
