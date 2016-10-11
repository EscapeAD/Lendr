class VerificationsController < ApplicationController
  before_action :authenticate_user!

  def show
    @verify          = Verification.find(params[:id])
    @status_text     = Verification.status_text(params[:id])
    @owner_of_item   = Item.find(params[:item_id])
    @borrower        = Checkout.find(params[:checkout_id])
    @messages        = @verify.messages.order(id: :desc).limit(500).reverse
    @message         = Message.new
    @users           = @verify.users
    unless @owner_of_item.user_id == current_user.id || @borrower.user_id == current_user.id
      redirect_to user_path
    end
    Verification.verify_staging(@verify)
  rescue ActiveRecord::RecordNotFound
      redirect_to user_url, notice: 'Item is been returned'
  end

  def new
  end

  def update
    @verify = Verification.find(params[:id])
    if !params[:meetup_location].nil?
      @verify.update_attribute(:meetup_location, params[:meetup_location])
      @verify.save
    else
      Verification.verify_user(params[:item_id], params[:checkout_id], params[:id],current_user)
      @verification_id = Verification.find_by(checkout_id: params[:checkout_id], status: 'pickup')
      Verification.verify_staging(@verify)
      if @verify.nil?
        redirect_to user_path
      end
      redirect_to user_path
      # redirect_to item_checkout_verification_url(params[:item_id], params[:id], @verification_id)
    end
    # render :new
  end

  def create
  end
end
