class MailsController < ApplicationController
  before_action :set_user

  def index
    @mails = Mail.where(:recipient == current_user.id)
  end

  def show
    @mail = Mail.find(params[:id])
    if @mail.open == true
      @mail.open = false
      @mail.save
    end
  end

  def new
    @mail = Mail.new
  end

  def create
    puts email_params
    puts params
    @mail = Mail.new(title: params[:title],
                     recipient: params[:recipient],
                      text: params[:text],
                      sender: current_user.id,
                      open: false)
    if @mail.save
      redirect_to root_path
    else
      render :new
    end
  end


private
def email_params
  # params.require(:mail).permit(:title, :recipient, :text, :sender).merge(open: false)
end

def set_user
  @user = current_user
end

end
