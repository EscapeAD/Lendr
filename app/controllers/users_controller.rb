class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @borrow          = Checkout.borrow_list(current_user.id)
    @count_inventory = Item.count_inventory(current_user.id)
    @lent            = Checkout.lent_out(current_user.id)
    @items           = Item.where(user_id: current_user.id)
    @pending         = Checkout.pending(current_user.id)


  end

  private

end
