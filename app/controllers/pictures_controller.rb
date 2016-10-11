class PicturesController < ApplicationController
  def show
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to item_path(params[:item_id])
  end
end
