class CheckoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
  end

  def new
    @checkout   = @user.checkouts.new
  end

  def create
    @ower_item  = Item.find(params[:item_id])
    @checkout   = Checkout.new(user_id: current_user.id, item_id: @ower_item.id)
    # Check to make sure borrower isn't owner
    if current_user.id == @ower_item.user_id
      redirect_to item_path(@ower_item), notice: "Sorry you can't borrow your own item"
    else
      mailbox_notice(@ower_item)
      if @checkout.save
        redirect_to item_path(@ower_item), notice: 'Borrow Notice, sent to owner'
      else
        redirect_to item_path(@ower_item), notice: 'There was a error sending a request'
      end
    end
  end

  def update
    @checkout   = Checkout.find(params[:id])
    @checkout.update_attribute(:check_initial, true)
    if @checkout.save
      @verify   = @checkout.verifications.new(checkout_id: params[:id], status: 'pickup')
      @verify.save
      redirect_to user_path
    else
      redirect_to user_path
    end
  end

  def destroy
    @checkout   = Checkout.find(params[:id])
    @verify     = Verification.where(checkout_id: params[:id])
    if @verify.nil?
      @message    = Message.where(Verification_id: @verify.id)
      if !@message.nil?
        @message.destroy_all
      end
    end
    @verify.destroy_all
    @checkout.destroy
    redirect_to user_path
  end

  private
  def checkout_params
    params.require(:checkouts).permit(:item_id)
  end

  def set_user
    @user       = current_user
  end

  def mailbox_notice(item)
  mail = Mailbox.new(title: "Notice: #{item.name}",
                    recipient: item.user_id,
                    text: 'You have recieve a request about item',
                    sender: current_user.id,
                    open: false)
  mail.save
  end
end
