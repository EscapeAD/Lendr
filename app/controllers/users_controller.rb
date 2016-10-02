class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
    @borrow          = Checkout.borrow_list(@user.id)
    @count_inventory = Item.count_inventory(@user.id)
    @lent            = Checkout.lent_out(@user.id)
    @items           = Item.where(user_id: @user.id)
    @pending         = Checkout.pending(@user.id)


  end

  private
  def set_user
    @user            = current_user
  end

end
