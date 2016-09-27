class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @borrow          = Checkout.checkout_list(current_user.id)
    @count_inventory = Item.borrow_list(current_user.id)


  end


end
