class ItemsController < ApplicationController
  before_action :set_user
  def index
    @items = Item.all
    #Append the first picture of each item into picList
    if request.xhr?
      input = params[:searchInput]
      items = Item.where('name ILIKE ?', "%#{input}%")
      render partial: 'items', locals: {searchItemList: items}
    end

  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @item.pictures.build
    @item.pictures.build

  end

  def create
    @item = @user.owned_items.new(item_params)
    if @item.save!
      redirect_to items_path
    else
      render :new, notice:"Error"
    end
  end

  def edit
    @item = Item.find(params[:id])
    @item.pictures.build
    @item.pictures.build
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      redirect_to @item
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    @item.save
    dragon_var = Checkout.where(item_id: params[:id])
    dragon_var.each do |element|
      found_checkout_element = Verification.where(checkout_id: element.id)
        found_checkout_element.each do | check_out_element |
          check_out_element.destroy
          check_out_element.save
        end
      element.destroy
      element.save
    end
    @item.destroy
    redirect_to root_path
  end


  def destroypic(pic)
    pic.destroy
  end

  private
  def item_params
    params.require(:item).permit(:name,:item_type,:description,:owner_id,pictures_attributes: [:id, :image, :_destroy])
  end

  def set_user
    @user = current_user
  end
end
