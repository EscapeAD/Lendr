class VerificationsController < ApplicationController
  def show
    @verify = Verification.find(params[:id])
  end

  def new

  end

  def update
    @verify = Verification.find(params[:id])
    Verification.verify_user(params[:item_id],params[:checkout_id],params[:id])
    redirect_to item_checkout_verification_path(params[:item_id],params[:checkout_id],params[:id])
  end

  def create

  end

end