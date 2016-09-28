class VerificationsController < ApplicationController
  def show
    @verify = Verification.find(params[:id])
  end

  def new

  end

  def create

  end

end
