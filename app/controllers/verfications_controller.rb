class VerificationsController < ApplicationController
  def show
    @verify = Verification.find(parmas[:id])

  end

  def new

  end

  def create

  end

end
