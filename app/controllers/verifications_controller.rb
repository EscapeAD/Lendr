class VerificationsController < ApplicationController
  def show
    @verify          = Verification.find(params[:id])
    @status_text     = Verification.status_text(params[:id])
    @owner_of_item   = Item.find(params[:item_id])
    @borrower        = Checkout.find(params[:checkout_id])
    unless @owner_of_item.user_id == current_user.id || @borrower.user_id == current_user.id
      redirect_to user_path
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to user_url, notice: 'Item is been returned'
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
  private



end
