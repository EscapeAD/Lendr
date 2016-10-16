class ItemsController < ApplicationController
  before_action :set_user

  def index
    @items = Item.all
    #Append the first picture of each item into picList
    if request.xhr?
      input       = params[:searchInput]
      cat_input   = params[:categoryInput]
      filtered_items = []

      # Click on category when there is nothing in search input #
      if input == nil &&  params[:longitude] == nil && params[:categoryInput] != ''
        items = Item.all
        items.each do |item|
          if item.category.name == cat_input
            filtered_items << item
          end
        end
        render partial: 'items', locals: {searchItemList: filtered_items}
      #If we have search input
      else
        #Click on Geolocation search button
        if params[:latitude] && params[:longitude]
          distance    = params[:distance]
          close_users = User.near([params[:latitude], params[:longitude]], distance, units: :km)
            close_users.each do |user|

              #Default
              # item = Item.where(user_id: user.id)
              # item.each do |test|
              #   filtered_items << test
              # end

              #Handling ONLY category input. Ignore searchInput
              # item = Item.where(user_id: user.id)
              # if params[:categoryInput]
              #   item.each do |test|
              #     if test.category.name == cat_input
              #         filtered_items << test
              #     end
              #   end
              # else
              #   item.each do |test|
              #     filtered_items << test
              #   end
              # end



              #Handle searchInput only
              if params[:searchInput] == ''    #If no search Input
                item = Item.where(user_id: user.id)
                item.each do |test|
                  filtered_items << test
                end
              else  #IF there is search input
                item = Item.where('name ILIKE ?', "%#{input}%")
                item.each do |test|
                  if test.user_id == user.id
                    filtered_items << test
                  end
                end
              end






              #Handling BOTH searchInput and category input
              # if params[:searchInput] == ''    #If no search Input
              #   item = Item.where(user_id: user.id)
              #   if params[:categoryInput]  #If there is category filter
              #     item.each do |test|
              #       if test.category.name == cat_input
              #           filtered_items << test
              #       end
              #     end
              #   else
              #     item.each do |test|
              #       filtered_items << test
              #     end
              #   end
              # else  #IF there is search input
              #   item = Item.where('name ILIKE ?', "%#{input}%")
              #   item.each do |test|
              #     if params[:categoryInput]   #If there is a category
              #       if test.user_id == user.id && test.category.name == cat_input
              #         filtered_items << test
              #       end
              #     else  #No category filter = Show all category
              #       if test.user_id == user.id
              #         filtered_items << test
              #       end
              #     end
              #   end
              # end

            end
          render partial: 'items', locals: {searchItemList: filtered_items}

          #If there is no latitude and longitude
        elsif  params[:searchInput] && params[:searchInput] != '' && params[:categoryInput] == ''  #If we did not click on category
          items = Item.where('name ILIKE ?', "%#{input}%")
          render partial: 'items', locals: {searchItemList: items}

        else
          items = Item.where('name ILIKE ?', "%#{input}%")
          puts items
          items.each do |item|
            if item.category.name == cat_input
              filtered_items << item
            end
          end
          render partial: 'items', locals: {searchItemList: filtered_items}
        end
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
