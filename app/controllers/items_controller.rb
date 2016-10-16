class ItemsController < ApplicationController
  before_action :set_user

  def index
    @items = Item.all
    #Append the first picture of each item into picList
    if request.xhr?
      search_input = params[:searchInput]
      cat_input   =  params[:categoryInput]
      filtered_items = []

      #If geolocation is selected
      if params[:latitude] && params[:longitude]
        distance    = params[:distance]
        close_users = User.near([params[:latitude], params[:longitude]], distance, units: :km)
        close_users.each do |user|
            if cat_input == 'All'
              items = Item.all
            else
              items = Item.where('name ILIKE ?', "%#{search_input}%")
            end

            if cat_input != '' && cat_input != nil && cat_input != 'All'
              items.each do |item|
                if item.user_id == user.id && item.category.name == cat_input
                  filtered_items << item
                end
              end
            else
              items.each do |item|
                if item.user_id == user.id
                  filtered_items << item
                end
              end
            end
          end
        render partial: 'items', locals: {searchItemList: filtered_items}

      #No geolocation selected
      else

        # If all category is selected
        if cat_input == 'All'
          filtered_items = Item.all


        # If we have a category
        elsif cat_input != '' && cat_input != nil
          items = Item.where('name ILIKE ?', "%#{search_input}%")
          items.each do |item|
            if item.category.name == cat_input
              filtered_items << item
            end
          end

        #If no category
        else
          filtered_items = Item.where('name ILIKE ?', "%#{search_input}%")
        end
        render partial: 'items', locals: {searchItemList: filtered_items}
      end
    end
  end


  def show
    @item    = Item.find(params[:id])
    @stories = Checkout.collect_story(params[:id])
    @owner   = User.find(@item.user_id)
    @mail    = Mailbox.new
  end

  def new
    @item = Item.new
    @item.pictures.build
  end

  def create
    @item = @user.owned_items.new(item_params)
    if @item.save!
      redirect_to items_path
    else
      render :new, notice: 'Error'
    end
  end

  def edit
    @item = Item.find(params[:id])
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
    picture_destroy = Picture.where(item_id: params[:id])
    picture_destroy.each do |picture|
      if !picture.nil?
        picture.destroy
        picture.save
      end
    end
    dragon_var.each do |element|
      found_checkout_element = Verification.where(checkout_id: element.id)
        found_checkout_element.each do |check_out_element|
          check_out_element.destroy
          check_out_element.save
        end
      element.destroy
      element.save
    end
    @item.destroy
    redirect_to root_path
  end

  private

  def destroypic(pic)
    pic.destroy
  end

  def item_params
    params.require(:item).permit(:name, :description, :owner_id, :category_id, pictures_attributes: [:id, :image, :_destroy])
  end

  def set_user
    @user = current_user
  end
end
